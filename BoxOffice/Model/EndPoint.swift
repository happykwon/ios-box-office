import Foundation

struct EndPoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension EndPoint {
    var url: URL {
        var componets = URLComponents()
        componets.scheme = "https"
        componets.host = "kobis.or.kr"
        componets.path = "/" + path
        componets.queryItems = queryItems
        guard let url = componets.url else { preconditionFailure("URLError: \(componets)") }
        return url
    }
}

extension EndPoint {
    static var boxOffice: Self {
        EndPoint(path: "kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")
    }
    static var moviInfo: Self {
        EndPoint(path: "kobisopenapi/webservice/rest/movie/searchMovieInfo.json")
    }

}



extension EndPoint {
    mutating func getBoxOfficeAPI(targetDate: String) {
        queryItems.append(URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888"))
        queryItems.append(URLQueryItem(name: "targetDt", value: targetDate))
    }
    mutating func getDetailMovieInfo(movieCode: String) {
        queryItems.append(URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888"))
        queryItems.append(URLQueryItem(name: "movieCd", value: movieCode))

    }
}


