//
//  MovieManager.swift
//  BoxOffice
//
//  Created by yujaehong on 2/14/24.
//

import Foundation

struct MovieManager {
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    let myKey = "28bc54ef1a1cee93b047842bb35b2c03"
    
    func fetchMovie(date: String, completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(movieURL)&key=\(myKey)&targetDt=\(date)"
        performRequest(with: urlString) { movies in
            completion(movies)
        }
    }
    
    func performRequest(with urlString: String, completion: @escaping ([Movie]?) -> Void) {
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
            
            if let movies = self.parseJSON(safeData) {
                completion(movies)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func parseJSON(_ movieData: Data) -> [Movie]? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(MovieData.self, from: movieData)
            let dailyLists = decodeData.boxOfficeResult.dailyBoxOfficeList
            
            let myMovieLists = dailyLists.map {
                Movie(movieNm: $0.movieNm, rank: $0.rank, openDate: $0.openDt, audiCnt: $0.audiCnt, accAudi: $0.audiAcc)
            }
            return myMovieLists
        } catch {
            print("파싱 실패")
            return nil
        }
    }
}
