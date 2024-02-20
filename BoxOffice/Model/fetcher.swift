import Foundation


struct fetcher {
    func fetchMovieInfo(movieCode: String) {
        var movieInfoData = EndPoint.moviInfoPath
        movieInfoData.getDetailMovieInfo(movieCode: movieCode)
        JSONLoader().loadJSONFromURL(from: movieInfoData.url.absoluteString) { (result: Result<MovieInfoResponse, Error>) in
            switch result {
            case .success(let response):
                dump(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    func fetchBoxOffice(targetDate: String) {
        var boxOfficeData = EndPoint.boxOfficePath
        boxOfficeData.getBoxOfficeAPI(targetDate: targetDate)
        JSONLoader().loadJSONFromURL(from: boxOfficeData.url.absoluteString) { (result: Result<BoxOfficeResponse, Error>) in
            switch result {
            case .success(let boxOfficeResponse):
                dump(boxOfficeResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
