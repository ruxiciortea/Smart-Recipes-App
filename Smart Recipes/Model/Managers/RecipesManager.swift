//
//  RecipesManager.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 21.04.2023.
//

import Foundation

class RecipesManager: NSObject {
    
    // MARK: - Login
    func getAll(auth: Token) async throws -> [Recipe]? {
        let recipes = try? await RecipesAPI.getAll(auth: auth)
        return recipes
    }

}
