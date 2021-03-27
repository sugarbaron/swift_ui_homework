//
//  MainScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.03.2021.
//

import SwiftUI

struct Main : View {
    
    var body: some View {
        NavigationRouter { MainScreen(.init()) }
    }
    
}

struct MainScreen : View {
    
    @ObservedObject private var recipesData: Recipes.ViewModel
    
    init(_ viewModel: Recipes.ViewModel) { self.recipesData = viewModel }
    
    var body: some View {
        VStack {
            Text("Recipes")
                .font(.largeTitle)
                .onAppear() { recipesData.loadPage() }
            
            Picker("options", selection: $recipesData.ingredient) {
                Text("cheese").tag("cheese")
                Text("garlic").tag("garlic")
            }
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(5)
            .foregroundColor(.white)
            RecipesListScreen(recipesData)
        }
    }
    
}


struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environmentObject(Recipes.ViewModel())
    }
}
