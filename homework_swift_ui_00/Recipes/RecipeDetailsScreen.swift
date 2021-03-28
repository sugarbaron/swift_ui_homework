//
//  RecipeDetailsScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.03.2021.
//

import SwiftUI

struct RecipeDetailsScreen : View {
    
    var recipe: Recipe
    let contentType: Recipes.ContentType
    var navigation: Navigation? = try? ServiceLocator.inject(Navigation.self)
    
    init(_ recipe: Recipe, _ contentType: Recipes.ContentType) {
        self.recipe = recipe
        self.contentType = contentType
    }
    
    var body: some View {
        VStack {
            Text(contentType == .ingredients ? "Ingredients" : "URL").font(.largeTitle)
            Spacer()
            Text(content)
            Spacer()
            if contentType == .ingredients {
                Button(label: "see url")
                    .cornerRadius(5)
                    .onTapGesture { navigation?.show(RecipeDetailsScreen(recipe, .href)) }
                Spacer()
            }
            Button(label: "back")
                .cornerRadius(5)
                .onTapGesture { navigation?.goBack() }
            Spacer()
        }
    }
    
    private var content: String {
        switch contentType {
        case .ingredients: return "\(recipe.ingredients ?? "[no ingredients found]")"
        case .href:        return "\(recipe.href)"
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
