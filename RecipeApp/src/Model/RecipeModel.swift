//
//  RecipeModel.swift
//  MPRecipe
//
//  Created by Mauricio Pimienta on 10/7/24.
//

import UIKit

protocol RecipeProtocol {
    var cuisine: String? { get }
    var name: String? { get }
    var photoUrlLarge: String? { get }
    var photoUrlSmall: String? { get }
    var sourceUrl: String? { get }
    var uuid: String? { get }
    var youtubeUrl: String? { get }
}

struct RecipeModel: Decodable, RecipeProtocol, Identifiable, Hashable {
    
    // Protocol
    var cuisine: String?
    var name: String?
    var photoUrlLarge: String?
    var photoUrlSmall: String?
    var sourceUrl: String?
    var uuid: String?
    var youtubeUrl: String?
    
    var id: ObjectIdentifier?
    
    enum RecipesCodingKeys: String, CodingKey {
        case cuisine, name, photoUrlLarge, photoUrlSmall, sourceUrl, uuid, youtubeUrl
    }
    
    // MARK: Init
    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: RecipesCodingKeys.self)
        cuisine = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.cuisine)
        name = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.name)
        photoUrlLarge = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.photoUrlLarge)
        photoUrlSmall = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.photoUrlSmall)
        sourceUrl = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.sourceUrl)
        uuid = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.uuid)
        youtubeUrl = try values.decodeIfPresent(String.self, forKey: RecipesCodingKeys.youtubeUrl)
    }
    
    // MARK: External
    static func == (lhs: RecipeModel, rhs: RecipeModel) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
}
