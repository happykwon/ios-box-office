import UIKit

class ViewController: UIViewController {
    
    var fetchingData = fetcher()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchingData.fetchBoxOffice(targetDate: "20240217")
        print("=======================")
        fetchingData.fetchMovieInfo(movieCode: "20247076")
    }


}



