//
//  RecipesListScreen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 13.03.2021.
//

import SwiftUI

struct Main : View {
    
    var body: some View {
        NavigationRouter { RecipesListScreen() }
    }
    
}

struct RecipesListScreen : View {
    
    @EnvironmentObject var recipesData: Recipes.ViewModel
    @EnvironmentObject var navigation: Navigation
    
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
            List { ForEach(enumerate(recipesData.recipes), id: \.1) { index, recipe in
                RecipeCell(recipe.title?.trimmed)
                    .background(Color(.lightGray))
                    .cornerRadius(5)
                    .onAppear() { if (isLastRecipe(index)) { recipesData.loadPage() } }
                    .onTapGesture { navigation.show(RecipeDetailsScreen(recipeIndex: index,
                                                                        contentType: .ingredients)) }
                if recipesData.isLoading && isLastRecipe(index) { Progress() }
            }}
        }
    }
    
    private func isLastRecipe(_ index: Int) -> Bool { index == recipesData.recipes.count - 1 }
    
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

private struct Progress : View {
    
    var body: some View {
        HStack { Spacer(); ProgressView().progressViewStyle(CircularProgressViewStyle()); Spacer() }
    }
    
}

private extension String {
    
    var trimmed: String {
        self.replacingOccurrences(of: "[\\t\\n\\r\\f\\v {2,}]", with: "", options: .regularExpression)
    }
    
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main().environmentObject(Recipes.ViewModel())
    }
}
