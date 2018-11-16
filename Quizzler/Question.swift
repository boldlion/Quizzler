//
//  Question.swift
//  Quizzler
//
//  Created by Bold Lion on 12/11/2018.
//  Copyright (c) 2018 Quizzler. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
