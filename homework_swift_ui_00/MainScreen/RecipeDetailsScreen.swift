//
//  RecipeDetailsScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.03.2021.
//

import SwiftUI

struct RecipeDetailsScreen : View {
    
    @EnvironmentObject var recipesData: Recipes.ViewModel
    @EnvironmentObject var navigation: Navigation
    
    let recipeIndex: Int
    let contentType: Recipes.ContentType
    
    var body: some View {
        VStack {
            Text(contentType == .ingredients ? "Ingredients" : "URL").font(.largeTitle)
            Spacer()
            Text(content)
            Spacer()
            if contentType == .ingredients {
                Button(label: "see url")
                    .cornerRadius(5)
                    .onTapGesture { navigation.show(RecipeDetailsScreen(recipeIndex: recipeIndex, contentType: .href)) }
                Spacer()
            }
            Button(label: "back")
                .cornerRadius(5)
                .onTapGesture { navigation.goBack() }
            Spacer()
        }
    }
    
    private var content: String {
        switch contentType {
        case .ingredients: return "\(recipesData.recipes[recipeIndex].ingredients ?? "[no ingredients found]")"
        case .href: return "\(recipesData.recipes[recipeIndex].href)"
        }
    }
    
}

private struct Button : View {
    
    let label: String
    
    var body: some View {
        Text("\(label)")
            .padding()
            .background(Color.orange)
    }
    
}
