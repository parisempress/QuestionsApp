import SwiftUI

struct QuestionsResponse: Codable {
    var items: [Question]
}

struct Question: Codable, Hashable {

    enum CodingKeys: String, CodingKey {
        case tags
        case owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case questionId = "question_id"
     // case contentLicense = "content_license"
        case link
        case title
        case body
        case acceptedAnswerId = "accepted_answer_id"
    }

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
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case reputation
        case userId = "user_id"
        case userType = "user_type"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
    }
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



