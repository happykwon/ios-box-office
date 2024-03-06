import Foundation

struct MovieAPIFetcher {
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchDetailMovieInfo(movieCode: String) {
        var movieInfoRequestURL = EndPoint.moviInfoPath
        movieInfoRequestURL.addDetailMovieInfoQueryItems(movieCode: movieCode)
        networkManager.fetchDetails(from: movieInfoRequestURL.url.absoluteString) { (result: Result<MovieInfoResponse, Error>) in
            switch result {
            case .success(let response):
                dump(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func convertToMyDailyBoxOfficeList(from response: BoxOfficeResponse, targetDate: String) -> [MyDailyBoxOfficeList] {
        return response.dailyBoxOffice.dailyBoxOfficeInfo.map { info -> MyDailyBoxOfficeList in
            let rankOldAndNew = RankOldAndNew(rawValue: info.rankOldAndNew.rawValue) ?? .new
            return MyDailyBoxOfficeList(
                movieNm: info.movieName,
                rank: info.rank,
                audiCnt: info.todayAudienceCount,
                accAudi: info.totalAudienceCount,
                rankOldAndNew: rankOldAndNew,
                targetDate: targetDate,
                rankInten: info.rankChange
            )
        }
    }
    
    func fetchBoxOffice(completion: @escaping (Result<[MyDailyBoxOfficeList], Error>) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let targetDate = dateFormatter.string(from: Date.yesterday)
        var boxOfficeRequestURL = EndPoint.boxOfficePath
        boxOfficeRequestURL.addBoxOfficeQueryItems(targetDate: targetDate)
        networkManager.fetchDetails(from: boxOfficeRequestURL.url.absoluteString) { (result: Result<BoxOfficeResponse, Error>) in
            switch result {
            case .success(let boxOfficeResponse):
                let myDailyBoxOfficeList = self.convertToMyDailyBoxOfficeList(from: boxOfficeResponse, targetDate: targetDate)
                completion(.success(myDailyBoxOfficeList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

