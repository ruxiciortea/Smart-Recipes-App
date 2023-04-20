//
//  KeychainManager.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 20.04.2023.
//

import UIKit

let kTokenKey = "token"

class KeychainManager: NSObject {
    
    static func getToken() -> Token? {
        guard let tokenValue = KeychainWrapper.standard.string(forKey: kTokenKey) else { return nil }
        
        return Token(value: tokenValue)
    }
    
    static func saveToken(token: Token) -> Bool {
        return KeychainWrapper.standard.set(token.token, forKey: kTokenKey)
    }
    
    static func removeToken() -> Bool {
        return KeychainWrapper.standard.removeObject(forKey: kTokenKey)
    }

}
