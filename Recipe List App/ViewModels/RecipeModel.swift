//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by John Corrigan on 6/10/22.
//

import Foundation
class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    init() {
        //create a instance of data service and get the data
        let service = DataService()
        self.recipes = service.getLocalData()
        //set the recipes property
        
        
    }
    static func getPortion(ingredient:Ingredient,recipeServing:Int, targetServings:Int ) -> String {
        //Get a single servings size by multiplying the denominator by the recipe servings
        
        //Get target portion by multiplying numerator by target portion
        
        //reduce fraction by greatest common divisor
        
        //Get the whole portion if Numerator is > denominator
        
        //Express the remainder as a fraction
        
       return String(targetServings)
        
    }
    
}
