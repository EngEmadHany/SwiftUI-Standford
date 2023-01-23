//
//  ContentView.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 08/10/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    // Update UI from Model
    var body: some View{
        
//        ScrollView{
//            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
//                ForEach(game.cards) { card in
                    AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                })
//            }
//        }
         .foregroundColor(.red)
         .padding(.horizontal)
        Spacer()
        
//    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUP {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content)
                        .font(font(in: geometry.size))
                    
                }  else if card.isMatched {
                    shape.opacity(0)
                }else {
                    shape.fill().foregroundColor(.orange)
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}

private struct DrawingConstants{
    static let cornerRadius: CGFloat = 20
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.8
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
