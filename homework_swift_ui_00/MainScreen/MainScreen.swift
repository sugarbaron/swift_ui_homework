//
//  ContentView.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.02.2021.
//

import SwiftUI
import Combine

struct Main : View {
    var body: some View { MainScreen(model: Storage.model) }
}

struct MainScreen : View {
    
    @ObservedObject var model: Model
    
    var body: some View {
        TabView<Int, TupleView>(selection: $model.activeScreenIndex) {
            WelcomeScreen()
                .tabItem { Text("hello") }
                .tag(0)
            ItemsListScreen(model)
                .tabItem { Text("items") }
                .tag(1)
            SatisfactionScreen()
                .tabItem { Text("satisfaction") }
                .tag(2)
            Homework05Screen()
                .environmentObject(RecipesViewModel())
                .tabItem { Text("homework_05") }
                .tag(3)
        }
    }
}

// MARK: preview

struct Main_Previews : PreviewProvider {
    static var previews: some View {
        Main()
            .previewDevice("iPhone 11")
    }
}
