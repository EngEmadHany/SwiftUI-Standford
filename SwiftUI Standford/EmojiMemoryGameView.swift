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
            
            if card.isMatched && !card.isFaceUP {
                CardView(card: card)
                    .opacity(0)
                    
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        })

        .foregroundColor(.red)
        .padding(.horizontal)
        
        
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Pie(startingAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 115-90),clockWise: true)
                    .padding(7).opacity(0.5)
                Text(card.content)
                    
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 6).repeatForever(autoreverses: false))
                    .font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUP)
        }
    }
    
    private func font(in size: CGSize) -> Font{
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
}

private struct DrawingConstants{
    static let cornerRadius: CGFloat = 10
    static let lineWidth: CGFloat = 3
    static let fontScale: CGFloat = 0.65
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}
