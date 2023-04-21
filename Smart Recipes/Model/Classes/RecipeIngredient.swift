//
//  RecipeIngredient.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 21.04.2023.
//

import Foundation

enum MeasuringUnit: Codable {
    case GRAM
    case MILLILITER
    case PINCH
    case TEASPOON
    case TABLESPOON
    case PIECE
}

class RecipeIngredient: NSObject, Codable {
    
    var ingredientName: String = ""
    var quantity: Int = 0
    var measuringUnit: MeasuringUnit = MeasuringUnit.PIECE
    
}
