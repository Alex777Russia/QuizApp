//
//  ContentView.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 25.08.2022.
//

import SwiftUI

struct GameView: View {
    let question: Question
    
    @State var guessIndex: Int? = nil
    
    var body: some View {
        ZStack {
            Color(.sRGB,
                  red: 0.7,
                  green: 0.7,
                  blue: 0.5,
                  opacity: 0.3)
                .ignoresSafeArea()
            
            VStack {
                Text("Quiz Time!")
                    .font(.largeTitle)
                    .foregroundColor(Color.red)
                    .padding()
                
                Text("Question 1 / 4")
                    .padding()
                
                Spacer()
                
                Text(question.questionText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                Spacer()
                
                HStack {
                    ForEach(question.possibleAnswer.indices) { index in
                        AnswerButton(text: question.possibleAnswer[index]) {
                            guessIndex = index
                        }
                        .background(colorForButton(at: index))
                        .disabled(guessIndex != nil)
                    }
                }
                if guessIndex != nil {
                    BottomText(str: "Next")
                }
            }.padding(.bottom)
        }
    }
    
    func colorForButton(at buttonIndex: Int) -> Color {
        guard let guessIndex = guessIndex, guessIndex == buttonIndex else { return .clear }
        
        if guessIndex == question.correctAnswerIndex {
            return .green
        } else {
            return .red
        }
    }
}

struct AnswerButton: View {
    let text: String
    let onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }) {
            Text(text)
        }
        .padding()
        .border(Color.blue, width: 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(question: Question.allQuestions[0])
        //ContentView()
            //.preferredColorScheme(.dark)
    }
}
