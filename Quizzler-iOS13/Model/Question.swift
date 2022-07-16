//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Zubair Irfan Khan on 02/06/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        options = a
        self.correctAnswer = correctAnswer
    }
}
