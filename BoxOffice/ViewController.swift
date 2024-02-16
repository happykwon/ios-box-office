//
//  ViewController.swift
//  BoxOffice
//
//  Created by yujaehong on 2/15/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieManager = MovieManager()
        
        movieManager.fetchMovie(date: "20210201") {  (movies: MovieData?) in
            if let movies = movies {
                let myMovies = movies.boxOfficeResult.dailyBoxOfficeList.map {
                    Movie(movieNm: $0.movieNm, rank: $0.rank, openDate: $0.openDt, audiCnt: $0.audiCnt, accAudi: $0.audiAcc)
                }
                dump(myMovies)
            } else {
                print("영화데이터가 없습니다. 다운로드에 실패했습니다.")
            }
        }
    }
    
}

