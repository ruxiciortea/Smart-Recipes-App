//
//  User.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 19.03.2023.
//

import Foundation

class User: NSObject, Codable {

    var firstname: String = ""
    var lastname: String = ""
    var email: String = ""
    var role: String = ""
    
    init(firstname: String, lastname: String, email: String, role: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.role = role
    }
    
}
 
