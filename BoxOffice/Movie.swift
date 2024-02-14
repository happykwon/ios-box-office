//
//  Movie.swift
//  BoxOffice
//
//  Created by yujaehong on 2/14/24.
//

import Foundation

// 내가 만들고 싶은 데이터
struct Movie {
    static var movieId: Int = 0
    let movieName: String
    let rank: Int
    let openDate: String
    let todayAudience: Int
    let totalAudience: Int
    
    init(movieNm: String, rank: String, openDate: String, audiCnt: String, accAudi: String) {
        self.movieName = movieNm
        self.rank = Int(rank)!
        self.openDate = openDate
        self.todayAudience = Int(audiCnt)!
        self.totalAudience = Int(accAudi)!
        Movie.movieId += 1
    }
}
