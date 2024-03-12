//
//  APIModel.swift
//  WysaAssignment
//
//  Created by Palak on 11/03/24.
//

import Foundation

struct APIModel : Decodable, Hashable {
    var results : [result]
}

struct result : Decodable, Hashable {
    var type : String
    var difficulty : String
    var category : String
    var question : String
    var correctAnswer : String
    var incorrectAnswer : [String]
    
    enum CodingKeys : String, CodingKey {
        case type = "type"
        case difficulty = "difficulty"
        case category = "category"
        case question = "question"
        case correctAnswer = "correct_answer"
        case incorrectAnswer = "incorrect_answers"
    }
}

