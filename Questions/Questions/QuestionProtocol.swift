import SwiftUI

protocol NetworkProtocol {
    func fetchQuestionsFromAPI() async throws -> [Question]
}

class MockQuestionService: NetworkProtocol {
    func fetchQuestionsFromAPI() async throws -> [Question] {
        let mockOwner = Owner(accountId: 1, reputation: 1, userId: 1, userType: "",
                              profileImage: "", displayName: "", link: "")

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
