//
//  Qustion.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 25.08.2022.
//

import Foundation

struct Question {
    let questionText: String
    let possibleAnswer: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(questionText: "What was the first computer bug?",
                 possibleAnswer: ["Fly",
                                  "Moth",
                                  "Ant",
                                  "Beetle"],
                 correctAnswerIndex: 1),
        Question(questionText: "What language did IOS developers use before Swift?",
                 possibleAnswer: ["Objective-C",
                                  "Python",
                                  "Ruby",
                                  "Java"],
                 correctAnswerIndex: 0),
        Question(questionText: "Computers use the digits zero and one to store data. What is this system called?",
                 possibleAnswer: ["Fraction",
                                  "Decinal",
                                  "Ternary",
                                  "Binary"],
                 correctAnswerIndex: 3),
        Question(questionText: "Who invented the World Wide Web?",
                 possibleAnswer: ["Steve Jobs",
                                  "Linus Torvalds",
                                  "Tim Berners-Leo",
                                  "Bill Gates"],
                 correctAnswerIndex: 2),
    ]
}
