import Foundation

struct EndPoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    var url: URL {
        var componets = URLComponents()
        componets.scheme = "https"
        componets.host = "kobis.or.kr"
        componets.path = "/" + path
        componets.queryItems = queryItems
        guard let url = componets.url else { preconditionFailure(NetworkError.urlError.localizedDescription) }
        return url
    }
    static var boxOfficePath: Self {
        EndPoint(path: "kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json")
    }
    static var moviInfoPath: Self {
        EndPoint(path: "kobisopenapi/webservice/rest/movie/searchMovieInfo.json")
    }
}

extension EndPoint {
    mutating func getBoxOfficeQueryItems(targetDate: String) {
        queryItems.append(URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888"))
        queryItems.append(URLQueryItem(name: "targetDt", value: targetDate))
    }
    
    mutating func getDetailMovieInfoQueryItems(movieCode: String) {
        queryItems.append(URLQueryItem(name: "key", value: "f5eef3421c602c6cb7ea224104795888"))
        queryItems.append(URLQueryItem(name: "movieCd", value: movieCode))
    }
}


