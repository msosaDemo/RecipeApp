//
//  RecipeListRow.swift
//  RecipeApp
//
//  Created by Mauricio Pimienta on 10/9/24.
//

import SwiftUI

struct RecipeListRow: View {
    let recipe: RecipeModel
    
    var body: some View {
        LazyHStack(spacing: 10) {
            AsyncImage(url: URL(string: recipe.photoUrlSmall ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10), style: FillStyle())
            } placeholder: {
                Image("Default")
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 100, height: 100)
            .padding(.vertical, 5).padding(.horizontal, 5)
            VStack(alignment: .leading, spacing: 10) {
                Text("\(recipe.name ?? "")").RTextRegular()
                    .lineLimit(2, reservesSpace: true)
                    .frame(maxWidth: 200, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                Text("\(recipe.cuisine ?? "")").RTextSmall()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
