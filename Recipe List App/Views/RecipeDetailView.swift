//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by John Corrigan on 6/21/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedServingSize = 2
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                VStack(alignment:.leading){
                  Text("Choose Portion Size")
                //Mark: Servings Size Picker
                    Picker("",selection: $selectedServingSize ){
                                Text("2").tag(2)
                                Text("4").tag(4)
                                Text("6").tag(6)
                                Text("8").tag(8)
                                    }.pickerStyle(SegmentedPickerStyle())
                        
                }.padding()
                   
                
                //MARK: Recipe Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .padding([.bottom, .top],10)
                    ForEach(recipe.ingredients)
                    {item in
                        Text("-" + RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServings: selectedServingSize) + item.name)
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
