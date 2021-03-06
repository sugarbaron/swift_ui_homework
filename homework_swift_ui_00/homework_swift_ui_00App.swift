//
//  homework_swift_ui_00App.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.02.2021.
//

import SwiftUI

@main
struct homework_swift_ui_00App: App {
    
    init() { registerServices() }
    
    private func registerServices() {
        ServiceLocator.register(RecipeAPI.self) { RecipeAPI() }
    }
    
    var body: some Scene {
        WindowGroup { MainScreen(.init()).enableNavigationRouting() }
    }
    
}
