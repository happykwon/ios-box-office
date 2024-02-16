import Foundation
class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        checkJSONLoader()
    }
    
    func checkJSONLoader() {
        do {
            let movie: BoxOffice? = try JSONLoader().loadJSONFromFile(from: .main, fileName:"box_office_sample" )
            dump(movie)
        } catch {
            print(error.localizedDescription)
        }
    }
    func check() {
        let url = EndPoint(path: ., querryItems: <#T##[URLQueryItem]#>)
            JSONLoader().loadJSONFromURL(urlString: url) { (result: Result<MovieInfoData, Error>) in
            switch result {
            case .success(let movieInfoData):
                print("Movie Name: \(movieInfoData.movieInfoResult.movieInfo.movieNm)")
                // 필요한 추가 처리를 여기에 수행합니다.
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
