//
//  ContentView.swift
//  RecipeApp
//
//  Created by Mauricio Pimienta on 10/9/24.
//

import SwiftUI

struct RecipesView: View {
    
    // MARK: Variables
    @State var errorMessage = ""
    @State var showErrorAlert = false
    @State private var showSplashView = true
    @State private var recipesModel: RecipesModel?
    @StateObject private var viewModel = RecipesViewModel()
    
    // MARK: View
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    if showSplashView {
                        MSplashView()
                            .transition(.opacity)
                            .animation(.easeInOut, value: showSplashView)
                    } else {
                        VStack {
                            let recipes = recipesModel?.recipes ?? []
                            let cuisines = Array(Set(recipes.map({ $0.cuisine ?? "" }))).sorted{ $0 < $1 }
                            List {
                                ForEach(cuisines, id: \.self) { cuisine in
                                    let sectionRecipes = viewModel.removeDupliateRecipes(recipes: recipes.filter {
                                        $0.cuisine == cuisine })
                                    Section(header: Text(cuisine).RTextHeader().id(cuisine)) {
                                        ForEach(sectionRecipes, id:\.name) { recipe in
                                            RecipeListRow(recipe: recipe)
                                        }
                                    }
                                    .listRowSeparatorTint(Color.ROrangeColor)
                                    .listRowInsets(.init(top: 0, leading: 5, bottom: 0, trailing: 5))
                                }
                                .listRowBackground(Color.clear)
                            }
                            .scrollContentBackground(.hidden)
                        }
                        .task {
                            do {
                                recipesModel = try await viewModel.getData()
                            } catch NetworkError.invalidUrl {
                                errorMessage = LocalizationSystem.rNetworkErrorUrl.localized
                                showErrorAlert = true
                            } catch NetworkError.invalidResponse {
                                errorMessage = LocalizationSystem.rNetworkErrorResponse.localized
                                showErrorAlert = true
                            } catch NetworkError.parseError {
                                errorMessage = LocalizationSystem.rNetworkErrorParsing.localized
                                showErrorAlert = true
                            } catch {
                                errorMessage = LocalizationSystem.rNetworkErrorUnexpected.localized
                                showErrorAlert = true
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .center)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showSplashView = false
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background (
                Image("RBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if !showSplashView {
                        Text(LocalizationSystem.rNavSubtitle.localized).RTextLarge()
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(isPresented: self.$showErrorAlert, content: {
            Alert(
                title: Text(LocalizationSystem.rNetworkError.localized),
                message: Text(errorMessage),
                dismissButton: .default(Text("Ok"))
            )
        })
    }
}

#Preview {
    RecipesView()
}
