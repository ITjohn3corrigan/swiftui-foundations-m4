//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by John Corrigan on 8/10/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
   
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    
    var body: some View {
       
        
        VStack(alignment:.leading, spacing: 0){
                Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40 )
                .font(.largeTitle)
               
            
                GeometryReader{geo in
                
                    TabView(selection: $tabSelectionIndex){
                // loop through each recipe
                    ForEach(0..<model.recipes.count)
                    {index in
                        // only show the recipe if the featured value is true
                        if model.recipes[index].featured == true {
                            Button(action:{
                                self.isDetailViewShowing = true
                                
                            }, label:{
                                ZStack{
                                    
                                    Rectangle().foregroundColor(.white)
                                    VStack(spacing:0)
                                    {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                        
                                    }
                                    }
                                   
                                   })//recipestack
                                .tag(index)
                                .sheet(isPresented:$isDetailViewShowing){
                                                                  RecipeDetailView(recipe:model.recipes[index])
                                                              .buttonStyle(PlainButtonStyle())
                                                              .frame(width: geo.size.width - 40, height: geo.size.height  - 100, alignment: .center)
                                                                                            .cornerRadius(15)
                                                                                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                        }
                          
                     
                        
                        
                            
                        }
                    }
                    
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment:.leading, spacing: 5){
                Text("Preperation Time:")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                Text("Healthy")
                
                    }
            .padding([.leading, .bottom])
            
                
        }.onAppear(perform: {setFeaturedIndex()})
        
        
        
    }
        
    func setFeaturedIndex(){
        var index = model.recipes.firstIndex {
            (recipe) ->Bool
            in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
    }


struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
