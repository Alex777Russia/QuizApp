//
//  GameViewModel.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 26.08.2022.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var game = Game()
    
    var questionText: String {
        game.currentQuestion.questionText
    }
    
    var answerIndices: Range<Int> {
        game.currentQuestion.possibleAnswer.indices
    }
    
    var correctAnswerIndex: Int {
        game.currentQuestion.correctAnswerIndex
    }
    
    var progressText: String {
        "Question \(game.currentQuestionIndex + 1) / \(game.questionCount)"
    }
    
    var selectionWasMade: Bool {
        game.selections[game.currentQuestion] != nil
    }
    
    var selectionCount: (Int, Int) {
        game.selectionCount
    }
    
    var correctSelectionCount: Int {
        game.selectionCount.correct
    }
    
    var incorrectSelectionCount: Int {
        game.selectionCount.incorrect
    }
    
    var gameIsOver: Bool {
        game.gameIsOver
    }
    
    var gameStartTime: Date {
        game.startTime
    }
    
    func answerText(for index: Int) -> String {
        game.currentQuestion.possibleAnswer[index]
    }
    
    func advanceGameState() {
        game.advanceGameState()
    }
    
    func makeSelectionForCurrentQuestion(at index: Int) {
        game.makeSelection(at: index)
    }
    
    func colorForButton(at buttonIndex: Int) -> Color {
        guard let selectedIndex = game.selections[game.currentQuestion], selectedIndex == buttonIndex else { return .clear }
        
        if selectedIndex == correctAnswerIndex {
            return .green
        } else {
            return .red
        }
    }
}
