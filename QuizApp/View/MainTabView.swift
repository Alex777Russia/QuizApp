//
//  MainTabView.swift
//  QuizApp
//
//  Created by Алексей Шевченко on 25.08.2022.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            GameView()
                .tabItem { Label("Game", systemImage: "gamecontroller") }
            ControlsView()
                .tabItem { Label("Controls", systemImage: "gear") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
