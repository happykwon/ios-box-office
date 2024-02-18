import UIKit

class ViewController: UIViewController {
    
    var fetchingData = fetch()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchingData.fetchBoxOffice(targetDate: "20240218")
        fetchingData.fetchMovieInfo(movieCode: "20247076")
    }




}



