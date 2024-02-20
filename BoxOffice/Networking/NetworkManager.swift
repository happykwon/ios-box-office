//
//  NetworkManager.swift
//  BoxOffice
//
//  Created by yujaehong on 2/20/24.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func performRequest<T: Codable>(urlString: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                completion(nil)
                return
            }
            
            guard let safeData = data else {
                completion(nil)
                return
            }
            
            if let parsingDatas: T = self.parseJSON(safeData) {
                completion(parsingDatas)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    private func parseJSON<T: Codable>(_ someData: Data) -> T? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(T.self, from: someData)
            return decodeData as? T
        } catch {
            print("파싱 실패")
            return nil
        }
    }
}
