//
//  Untitled.swift
//  Questions
//
//  Created by Rochelle Simone Lawrence on 09.09.24.
//

import SwiftUI

struct QuestionsResponse: Codable {
  var items: [Question]
}


struct Question: Codable, Identifiable {
    let id: Int
    var tags: [String]
    var owner: Owner
    var is_answered: Bool
    var view_count: Int
    var answer_count: Int
    var score: Int
    var last_activity_date: Int
    var creation_date: Int
    var last_edit_date: Int?
    var question_id: Int
    var content_license: String
    var link: String
    var title: String
    var accepted_answer_id: Int?
}


struct Owner: Codable {
    var account_id: Int
    var reputation: Int
    var user_id: Int
    var user_type: String
    var profile_image: String
    var display_name: String
    var link: String
}

