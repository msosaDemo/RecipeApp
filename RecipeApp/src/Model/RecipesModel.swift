//
//  RecipesModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import SwiftUI

struct RecipesModel: Decodable {
    
    var recipes: [RecipeModel]?
    
    enum RecipesCodingKeys: String, CodingKey {
        case recipes
    }
    
    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: RecipesCodingKeys.self)
        recipes = try values.decodeIfPresent([RecipeModel].self, forKey: RecipesCodingKeys.recipes)
    }
    
}
    
