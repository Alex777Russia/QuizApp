//
//  ContentView.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 25.08.2022.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Text("Quiz Time!")
                    .font(.largeTitle)
                    .foregroundColor(Color.red)
                    .padding()
                
                Text(viewModel.progressText)
                    .padding()
                
                Spacer()
                
                Text(viewModel.questionText)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                Spacer()
                
                HStack {
                    ForEach(viewModel.answerIndices) { index in
                        AnswerButton(text: viewModel.answerText(for: index)) {
                            viewModel.makeSelectionForCurrentQuestion(at: index)
                        }
                        .background(viewModel.colorForButton(at: index))
                        .disabled(viewModel.selectionWasMade)
                    }
                }
                if viewModel.selectionWasMade {
                    Button(action: viewModel.advanceGameState, label: {
                        BottomText(str: "Next")
                    })
                }
            }.padding(.bottom)
        }
        .navigationBarHidden(true)
        .background(resultsNavigationLink)
    }
    
    private var resultsNavigationLink: some View {
        NavigationLink(destination: ResultsView(viewModel: ResultsViewModel(selectionCount: viewModel.selectionCount, gameStartTime: viewModel.gameStartTime, gameEndTime: Date())),
                       isActive: .constant(viewModel.gameIsOver),
                       label: { EmptyView() })
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
        NavigationView {
            GameView()
        }
    }
}
