import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieInfo()
    }


    func fetchMovieInfo() {
        var getMovieData = EndPoint.boxOffice
        getMovieData.getBoxOfficeAPI(targetDate: "20240214")
        JSONLoader().loadJSONFromURL(from: getMovieData.url.absoluteString) { (result: Result<BoxOffice, Error>) in
            switch result {
            case .success(let boxOfficeResponse):
                dump(boxOfficeResponse.boxOfficeResult.dailyBoxOfficeList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
}


