//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var downloadedMovies = [Movie]()
        
        let movieManager = MovieManager()
        
        movieManager.fetchMovie(date: "20210201") { movies in
            if let movies = movies {
                downloadedMovies = movies
                dump(downloadedMovies)
                
                print("전체 영화 갯수: \(Movie.movieId)")
            } else {
                print("영화데이터가 없습니다. 다운로드에 실패했습니다.")
            }
        }
    }
}

