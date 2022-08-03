//
//  DataService.swift
//  Recipe List App
//
//  Created by John Corrigan on 6/10/22.
//

import Foundation
class DataService {
    func getLocalData() -> [Recipe]{
        //parse local json file
        
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if path string is not nill, otherwise...
        guard pathString != nil else {
            return[Recipe]()
        }
       
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        do {
        //create a data object
        let data = try Data(contentsOf: url)
            
            //decode the data with a json decoder
            let decoder = JSONDecoder()
            do {
                let recipeData  =  try decoder.decode([Recipe].self, from: data)
               
                //add the unique ids
                for r in recipeData {
                    r.id = UUID()
                }
                //return the recipes
                return recipeData
                
            }
            catch{
                //error with parsing json
                print(error)
            }
           
            

        }
        catch {
            print(error)
        }
        return[Recipe]()
        
        
        
    }
}
