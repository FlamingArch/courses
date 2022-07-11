//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Harsh Chaturvedi on 07/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let question : String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String] = ["True", "False"], correctAnswer: String) {
        self.question = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
