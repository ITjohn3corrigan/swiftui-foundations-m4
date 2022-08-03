//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by John Corrigan on 6/21/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                //MARK: Recipe Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .padding([.bottom, .top],10)
                    ForEach(recipe.ingredients, id:\.self)
                    {item in
                     Text("-" + item)
                            .padding(.bottom,5)
                        
                    }
                    
                }
                .padding(.horizontal)
                Divider()
                
                //MARK: Recipe Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom,8)
                    ForEach(0..<recipe.directions.count, id: \.self)
                    {
                     index in
                        Text(String(index + 1)+". " + recipe.directions[index])
                            .padding ([.bottom, .top], 5)
                        
                        
                    }
                }
                .padding(.horizontal, 10.0)
                
                
            }

            
        
    }
        .navigationBarTitle(recipe.name)
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}

}
