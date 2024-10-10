//
//  SplashView.swift
//  RecipeApp
//
//  Created by Mauricio Pimienta on 10/9/24.
//

import SwiftUI

struct MSplashView: View {
    
    // MARK: View
    var body: some View {
        ZStack {
            Spacer()
            Text(LocalizationSystem.rTitle.localized).RTextSplash()
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background (
            Image("RSplash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    MSplashView()
}
