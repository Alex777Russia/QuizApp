//
//  ResultsView.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 27.08.2022.
//

import SwiftUI

struct ResultsView: View {
    let viewModel : ResultsViewModel
    
    var body: some View {
        ZStack {
            GameColor.main.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Text("Final Score: ")
                    Text(viewModel.finalPercentText)
                }
                .font(.title)
                .padding()
                HStack {
                    Text("Letter grade: ")
                    Text(viewModel.letterGradeText)
                }
                .padding()
                .font(.title)
                Text(viewModel.correctSelectionText)
                    .font(.system(size: 30))
                Text(viewModel.incorrectSelectionText)
                    .font(.system(size: 30))
                Text("Total time: \(viewModel.totalGameTimeText)")
                Spacer()
                NavigationLink(destination: GameView(),
                               label: {
                    BottomText(str: "Re-take Quiz")
                        .padding(.bottom)
                })
            }
        }
        .navigationBarHidden(true)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultsView(viewModel: ResultsViewModel(selectionCount: (3, 1), gameStartTime: Date(), gameEndTime: Date()))
        }
    }
}
