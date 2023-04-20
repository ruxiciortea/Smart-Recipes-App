//
//  Token.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 20.04.2023.
//

import Foundation

class Token: NSObject, Codable {

    var token: String = ""
    
    init(value: String) {
        self.token = value
    }
    
}
