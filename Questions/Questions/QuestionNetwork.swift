import SwiftUI

class Network {
    func fetchQuestionsFromAPI() async throws -> [Question] {
        let urlString = "https://api.stackexchange.com/2.3/questions?" +
                            "fromdate=1725753600&" +
                            "todate=1726358400&" +
                            "order=desc&" +
                            "sort=activity&" +
                            "site=stackoverflow&" +
                            "filter=!nNPvSNPI7A"
        guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
            }
        let (data, _) = try await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        // TODO: Review 
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try jsonDecoder.decode(QuestionsResponse.self, from: data)
        return decoded.items
    }
}
