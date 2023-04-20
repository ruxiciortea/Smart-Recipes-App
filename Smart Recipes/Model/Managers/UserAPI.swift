//
//  UserAPI.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 20.04.2023.
//

import Foundation

let kBaseUrl = "http://localhost:8080/api/auth/"
let kAuth = "authenticate"
let kRegister = "register"
let kGet = "get"

class UserAPI: NSObject {

    // MARK: - Login
    static func login(email: String, password: String) async throws -> Token? {
        guard let url = URL(string: kBaseUrl + kAuth) else { return nil }
        
        let bodyData = ["email" : email, "password": password]
        let jsonBody = try? JSONEncoder().encode(bodyData)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonBody
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
        guard let token = try? JSONDecoder().decode(Token.self, from: data) else {
            return nil
        }
        
        return token
    }
    
    //MARK: - Register
    static func register(firstName: String,
                         lastName: String,
                         email: String,
                         password: String,
                         reenteredPAssword: String,
                         role: String) async throws -> Token? {
        guard let url = URL(string: kBaseUrl + kRegister) else { return nil }
        
        let bodyData = [
            "firstname" : firstName,
            "lastname" : lastName,
            "email" : email,
            "password": password,
            "role" : role
        ]
        
        let jsonBody = try? JSONEncoder().encode(bodyData)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonBody
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
        guard let token = try? JSONDecoder().decode(Token.self, from: data) else {
            return nil
        }
        
        return token
    }
    
}
