//
//  Homework05Screen.swift
//  homework_swift_ui_00
//
//  Created by sugarbaron on 13.03.2021.
//

import SwiftUI

struct Homework05Screen : View {
    
    var body: some View {
        NavigationRouter { RootScreen() }
    }
    
}

struct RootScreen : View {
    
    @EnvironmentObject var recipesData: RecipesViewModel
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
                Cell(recipe.title?.trimmed)
                    .background(Color(.lightGray))
                    .cornerRadius(5)
                    .onAppear() { if (isLastRecipe(index)) { recipesData.loadPage() } }
                    .onTapGesture { navigation.show(DetailsScreen(recipeIndex: index, contentType: .ingredients)) }
                if recipesData.isLoading && isLastRecipe(index) { Progress() }
            }}
        }
    }
    
    private func isLastRecipe(_ index: Int) -> Bool { index == recipesData.recipes.count - 1 }
    
}

fileprivate struct Cell : View {
    
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

fileprivate struct DetailsScreen : View {
    
    @EnvironmentObject var recipesData: RecipesViewModel
    @EnvironmentObject var navigation: Navigation
    
    let recipeIndex: Int
    let contentType: ContentType
    
    var body: some View {
        VStack {
            Text(contentType == .ingredients ? "Ingredients" : "URL").font(.largeTitle)
            Spacer()
            Text(content)
            Spacer()
            if contentType == .ingredients {
                Button(label: "see url")
                    .cornerRadius(5)
                    .onTapGesture { navigation.show(DetailsScreen(recipeIndex: recipeIndex, contentType: .href)) }
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

fileprivate struct Button : View {
    
    let label: String
    
    var body: some View {
        Text("\(label)")
            .padding()
            .background(Color.orange)
    }
    
}

fileprivate struct Progress : View {
    
    var body: some View {
        HStack { Spacer(); ProgressView().progressViewStyle(CircularProgressViewStyle()); Spacer() }
    }
    
}

fileprivate enum ContentType { case ingredients; case href }

final class RecipesViewModel : ObservableObject {
    
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

extension Recipe : Identifiable { public var id: String { title ?? "" } }

fileprivate extension String {
    
    var trimmed: String {
        self.replacingOccurrences(of: "[\\t\\n\\r\\f\\v {2,}]", with: "", options: .regularExpression)
        /*
        let prepared: String = self.replacingOccurrences(of: "[\\t\\n\\r\\f\\v {2,}]", with: "", options: .regularExpression)
        return prepared.replacingOccurrences(of: "[ ]{2,}", with: "", options: .regularExpression)
        */
    }
    
}


struct Homework05Screen_Previews: PreviewProvider {
    static var previews: some View {
        Homework05Screen().environmentObject(RecipesViewModel())
    }
}
