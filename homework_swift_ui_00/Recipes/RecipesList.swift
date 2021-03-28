//
//  RecipesList.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 13.03.2021.
//

import SwiftUI

struct RecipesList : View {
    
    @ObservedObject private var recipesData: Recipes.ViewModel
    private var navigation: Navigation? = try? ServiceLocator.inject(Navigation.self)
    
    init(_ viewModel: Recipes.ViewModel) { self.recipesData = viewModel }
    
    var body: some View {
        List { ForEach(enumerate(recipesData.recipes), id: \.1) { index, recipe in
            RecipeCell(recipe.title?.trimmed)
                .background(Color(.lightGray))
                .cornerRadius(5)
                .onAppear() { if (isLastRecipe(index)) { recipesData.loadPage() } }
                .onTapGesture { navigation?.show(RecipeDetailsScreen(recipe, .ingredients)) }
            if recipesData.isLoading && isLastRecipe(index) { ProgressIndicator() }
        }}
    }
    
    private func isLastRecipe(_ index: Int) -> Bool { index >= recipesData.recipes.count - 1 }
    
}

private struct RecipeCell : View {
    
    let recipeName: String
    
    init(_ name: String?) { self.recipeName = name ?? "[unnamed]" }
    
    var body: some View {
        VStack {
            Spacer()
            HStack { Spacer().frame(width: 10); Text(recipeName); Spacer() }
            Spacer()
        }
    }
    
}

private extension String {
    
    var trimmed: String {
        self.replacingOccurrences(of: "[\\t\\n\\r\\f\\v {2,}]", with: "", options: .regularExpression)
    }
    
}
