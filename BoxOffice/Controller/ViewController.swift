import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        Fetcher().fetchBoxOffice(targetDate: "20231225")
        Fetcher().fetchMovieInfo(movieCode: "20203702")
    }
}




