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
    
    // MARK: - Update
    func update(auth: Token,
                  firstName: String,
                  lastName: String,
                  email: String,
                  role: String) async throws -> User? {
        let user = try? await UserAPI.update(auth: auth,
                                              firstName: firstName,
                                              lastName: lastName,
                                              email: email,
                                              role: role)
        return user
    }
    
    // MARK: - User Details
    func userData(auth: Token) async throws -> User? {
        let user = try? await UserAPI.userData(auth: auth)
        return user
    }
    
    // MARK: - Delete User
    func delete(auth: Token) async throws -> Bool {
        guard let response = try? await UserAPI.delete(auth: auth) else { return false }
        return response
    }
    
}
