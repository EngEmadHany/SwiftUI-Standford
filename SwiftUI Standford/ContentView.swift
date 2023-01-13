//
//  ContentView.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 08/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    // Update UI from Model 
    var body: some View{
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
                    ForEach(viewModel.cards, id: \.self) { emoji in
                        CardView(content: emoji, isFaceUP: true)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            Spacer()
      
        }.padding(.horizontal)
    }
    
    
    var remove:  some View{
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .font(.largeTitle)
        }
    }
    
    var add: some View{
        Button {
            if emojiCount < emojis.count - 1{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .font(.largeTitle)
        }
    }
}





struct CardView: View {
    var content: String
  
    
    
    var body: some View {
        
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
                    .foregroundColor(.orange)
            }
        }
       
    }
}





struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
