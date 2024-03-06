import Foundation

protocol NetworkManagerProtocol {
    func fetchDetails<T: Codable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void)
}

struct NetworkManager: NetworkManagerProtocol {
    private func loadJSONFromURL<T: Codable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "URLError", code: 404, userInfo: nil)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(NSError(domain: "DateError", code: 500)))
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
    
    func fetchDetails <T: Codable>(from urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        loadJSONFromURL(from: urlString, completion: completion)
    }
}
