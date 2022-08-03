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
    
}
