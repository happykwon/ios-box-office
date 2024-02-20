//
//  MyDailyBoxOfficeList.swift
//  BoxOffice
//
//  Created by yujaehong on 2/15/24.
//

import Foundation

struct MyDailyBoxOfficeList: Decodable {
    let movieName: String
    let rank: Int
    let openDate: String
    let todayAudience: Int
    let totalAudience: Int
    let movieCodeNumber: Int
    
    init(movieNm: String, rank: String, openDate: String, audiCnt: String, accAudi: String, movieCodeNm: String) {
        self.movieName = movieNm
        self.rank = Int(rank)!
        self.openDate = openDate
        self.todayAudience = Int(audiCnt)!
        self.totalAudience = Int(accAudi)!
        self.movieCodeNumber = Int(movieCodeNm)!
    }
}
