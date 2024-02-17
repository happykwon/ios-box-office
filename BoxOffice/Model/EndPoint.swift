
import Foundation

struct EndPoint {
    var path: String
    var querryItems: [URLQueryItem] = []
}

extension EndPoint {
    var url: URL {
        var componets = URLComponents()
        componets.scheme = "http"
        componets.host = "kobis.or.kr"
        componets.path = "/" + path
        componets.queryItems = querryItems
        
        guard let url = componets.url else { preconditionFailure("URLError: \(componets)") }
        return url
    }
}

extension EndPoint {
    static var dailyBoxOfficeList: Self {
        EndPoint(path: "kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")
    }
    static var moviInfo: Self {
        EndPoint(path: "kobisopenapi/webservice/rest/movie/searchMovieInfo.json")
    }
}

