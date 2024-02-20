import UIKit

class ViewController: UIViewController {
    
    var test1 = Fetcher
    
    override func viewDidLoad() {
        super.viewDidLoad()
        20240217
        test1.fetchBoxOffice(<#T##self: Fetcher##Fetcher#>)
        Fetcher().fetchMovieInfo(movieCode: "20247076")
    }

}



