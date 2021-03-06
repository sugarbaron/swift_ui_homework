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
                .tabItem { Text("push me") }
                .tag(2)
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
