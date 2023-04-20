//
//  UserManager.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 19.03.2023.
//

import Foundation

class UserManager: NSObject {
    
    // MARK: - Login
    func login(email: String, password: String) async throws -> Token? {
        let token = try? await UserAPI.login(email: email, password: password)
        return token
    }
    
    // MARK: - Register
    func register(firstName: String,
                  lastName: String,
                  email: String,
                  password: String,
                  reenteredPAssword: String,
                  role: String) async throws -> Token? {
        let token = try? await UserAPI.register(firstName: firstName,
                                                lastName: lastName,
                                                email: email,
                                                password: password,
                                                reenteredPAssword: reenteredPAssword,
                                                role: role)
        return token
    }
    
}
