//
//  MovieManager.swift
//  BoxOffice
//
//  Created by yujaehong on 2/15/24.
//

import Foundation

struct MovieManager {
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    let myKey = "28bc54ef1a1cee93b047842bb35b2c03"
    
    func fetchMovie<T: Codable>(date: String, completion: @escaping (T?) -> Void) {
        let urlString = "\(movieURL)&key=\(myKey)&targetDt=\(date)"
        performRequest(with: urlString) { movies in
            completion(movies)
        }
    }
    
    func performRequest<T: Codable>(with urlString: String, completion: @escaping (T?) -> Void) {
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
    
    func parseJSON<T: Codable>(_ movieData: Data) -> T? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(MovieData.self, from: movieData)
            return decodeData as? T
        } catch {
            print("파싱 실패")
            return nil
        }
    }
}

