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
        var porition = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        if ingredient.num != nil {
            
            
            //Get a single servings size by multiplying the denominator by the recipe servings
            denominator *= recipeServing
            
            //Get target portion by multiplying numerator by target portion
            numerator *= targetServings
            
            //reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
           numerator /= divisor
           denominator /= divisor
            
            //Get the whole portion if Numerator is > denominator
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                porition += String(wholePortions)
                
            }
            if numerator > 0 {
                porition += wholePortions > 0 ? " " :""
                
                porition += "\(numerator)/\(denominator)"
                
            }
            }
       
            if var unit = ingredient.unit {
             
                if wholePortions > 1 {
                    if unit.suffix(2) == "ch"{
                        unit  += "es"
                    } else if unit.suffix(1) == "f"{
                        unit = String(unit.dropLast())
                        unit += "ves"
                    }else {
                        unit += "s"
                    }
                    
                    
                }
               
        
            porition += ingredient.num == nil && ingredient.denom == nil ? "":" "
            
            return porition + unit
                
            }
        return porition
        }
            //Express the remainder as a fraction
                  
       
        
        
      
      
        
    }
    

