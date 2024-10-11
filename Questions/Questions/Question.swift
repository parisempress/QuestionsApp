import SwiftUI

struct QuestionsResponse: Codable {
    var items: [Question]
}

struct Question: Codable, Hashable {
    var tags: [String]
    var owner: Owner
    var isAnswered: Bool
    var viewCount: Int
    var answerCount: Int
    var score: Int
    var lastActivityDate: Int
    var creationDate: Int
    var lastEditDate: Int?
    var questionId: Int
    // var contentLicense: String
    var link: String
    var title: String
    var body: String
    var acceptedAnswerId: Int?
}

struct Owner: Codable, Hashable {
    var accountId: Int
    var reputation: Int
    var userId: Int
    var userType: String
    var profileImage: String
    var displayName: String
    var link: String
}

extension Question: Identifiable {
    var id: Int {
        return questionId
    }
}
