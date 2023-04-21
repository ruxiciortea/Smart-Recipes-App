//
//  RecipesAPI.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 21.04.2023.
//

import Foundation

let kRecipesBaseUrl = "http://localhost:8080/api/recipe/"
let kAll = "all"

class RecipesAPI: NSObject {
    
    // MARK: - Get All Recipes
    static func getAll(auth: Token) async throws -> [Recipe]? {
        guard let url = URL(string: kRecipesBaseUrl + kAll) else { return nil }
                
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(auth.token)", forHTTPHeaderField: "Authorization")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
        guard let recipes = try? JSONDecoder().decode([Recipe].self, from: data) else { return nil }
        
        return recipes
    }

}
