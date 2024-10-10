//
//  RecipesViewModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import SwiftUI

final class RecipesViewModel: ObservableObject {
    
    // MARK: Constants
    private let recipesUrlString = Endpoints.NetworkUrl.recipes
    let cellHeight: CGFloat = 120
    
    // MARK: Variables
    @Published var model: RecipesModel?
    
    // MARK: External
    func getData() async throws -> RecipesModel? {
        guard let url = URL(string: recipesUrlString) else {
            throw NetworkError.invalidUrl
        }
        
        return try await NetworkCaller.shared.loadFrom(url: url)
    }
    
    func removeDupliateRecipes(recipes: [RecipeModel]) -> [RecipeModel] {
        var uRecipes = [RecipeModel]()
        for recipe in recipes {
            if !uRecipes.contains(where: { $0 == recipe }) {
                uRecipes.append(recipe)
            }
        }
        return uRecipes
    }
    
}
