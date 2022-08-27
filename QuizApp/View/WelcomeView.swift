//
//  WelcomeView.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 27.08.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                GameColor.main.ignoresSafeArea()
                VStack {
                    Text("Quiz Time!")
                        .font(.largeTitle)
                        .foregroundColor(Color.red)
                        .padding()
                    Text("Select the correct answer to each of the following question")
                        .font(.title2)
                        .padding()
                    Spacer()
                    NavigationLink(destination: GameView(),
                                   label: {
                                        BottomText(str: "Let's Go!")
                                            .padding(.bottom)
                                    })
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
