//
//  File.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import Foundation

class Question {
    var questionArray: [String]
    init() {
        // So far questions asked should be unique & constant
        questionArray = ["What did I learn about God today?", "What was one thing I have thanked God for?"]
    }
    func getQuestion() -> String? {
        if !questionArray.isEmpty {
            let questionNumber = Int.random(in: 0 ..< questionArray.count)
            print(questionNumber)
            let question =  questionArray[questionNumber]
            questionArray.remove(at: questionNumber)
            return question
        } else {
            return nil
        }
    }
    func getArray() {
        print(questionArray)
    }
    // Allows placing back previous & new questions
    func addQuestion(question: String) {
        questionArray.append(question)
    }
    func questionIsEmpty() -> Bool {
        return questionArray.isEmpty
    }
}
