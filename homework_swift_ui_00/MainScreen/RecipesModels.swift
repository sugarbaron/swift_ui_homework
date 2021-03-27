//
//  RecipesModels.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 27.03.2021.
//

import SwiftUI

/* namespace class */
class Recipes { }

extension Recipes {
    
    final class ViewModel : ObservableObject {
        
        @Published var ingredient: String = "cheese" { didSet {
            if (ingredient != previousIngredient) { recipes = [ ] }
            previousIngredient = ingredient
            pageNumber = 0
            loadPage()
        } }
        @Published var recipes: [Recipe] = .init()
        @Published var pageNumber: Int = 0
        @Published var isLoading: Bool = false
        
        private var previousIngredient: String = ""
        
        func loadPage() {
            guard isLoadingComplete else { return }
            isLoading = true
            pageNumber += 1
            RecipeAPI.getRecipe(i: ingredient, p: pageNumber) { [weak self] response, error in
                defer { self?.isLoading = false }
                guard let newRecipes = response?.results else { return }
                self?.recipes.append(contentsOf: newRecipes)
            }
        }
        
        private var isLoadingComplete: Bool { isLoading == false }
        
    }
    
}

extension Recipes { enum ContentType { case ingredients; case href } }

extension Recipe : Identifiable { public var id: String { title ?? "" } }
