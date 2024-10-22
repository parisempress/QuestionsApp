import SwiftUI

class Network: NetworkProtocol {
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

protocol NetworkProtocol {
    func fetchQuestionsFromAPI() async throws -> [Question]
}

class MockQuestionService: NetworkProtocol {
    func fetchQuestionsFromAPI() async throws -> [Question] {

        let mockOwner = Owner(accountId: 1, reputation: 1, userId: 1, userType: "", profileImage: "", displayName: "", link: "")

        return [Question(tags: [""],
                         owner: mockOwner,
                         isAnswered: true,
                         viewCount: 1,
                         answerCount: 1,
                         score: 1,
                         lastActivityDate: 1,
                         creationDate: 1,
                         questionId: 1,
                         link: "",
                         title: "Mock Question",
                         body: "This is a mock question body.")]
    }
}
