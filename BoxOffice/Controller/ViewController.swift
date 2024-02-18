import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchBoxOffice()
        fetchMovieInfo()
    }


    func fetchBoxOffice() {
        var boxOfficeData = EndPoint.boxOffice
        boxOfficeData.getBoxOfficeAPI(targetDate: "20240214")
        JSONLoader().loadJSONFromURL(from: boxOfficeData.url.absoluteString) { (result: Result<BoxOffice, Error>) in
            switch result {
            case .success(let boxOfficeResponse):
                dump(boxOfficeResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchMovieInfo() {
        var movieInfoData = EndPoint.moviInfo
        movieInfoData.getDetailMovieInfo(movieCode: "20236180")
        JSONLoader().loadJSONFromURL(from: movieInfoData.url.absoluteString) { (result: Result<MovieInfoResponse, Error>) in
            switch result {
            case .success(let response):
                dump(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



