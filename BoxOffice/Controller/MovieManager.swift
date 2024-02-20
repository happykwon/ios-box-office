//
//  MovieManager.swift
//  BoxOffice
//
//  Created by yujaehong on 2/15/24.
//

import Foundation

struct MovieManager {
    private let networkManager: NetworkManager
    private let myKey = "28bc54ef1a1cee93b047842bb35b2c03"
    private let searchDailyBoxOfficeListURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    private let searchMovieInfoURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?"
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchDailyBoxOfficeList(date: String, completion: @escaping (DailyBoxOfficeListData?) -> Void) {
        let urlString = "\(searchDailyBoxOfficeListURL)&key=\(myKey)&targetDt=\(date)"
        networkManager.performRequest(urlString: urlString, completion: completion)
    }
    
    func fetchMovieInfo(movieCode: String, completion: @escaping (MovieInfoData?) -> Void) {
        let urlString = "\(searchMovieInfoURL)&key=\(myKey)&movieCd=\(movieCode)"
        networkManager.performRequest(urlString: urlString, completion: completion)
    }
}
