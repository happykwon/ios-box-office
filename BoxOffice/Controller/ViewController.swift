import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetcher().fetchBoxOffice(targetDate: "20240217")
        fetcher().fetchMovieInfo(movieCode: "20247076")
    }

}



