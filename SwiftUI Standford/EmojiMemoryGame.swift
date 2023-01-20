//
//  EmojiMemoryGame.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 06/01/2023.
//

import SwiftUI

func makeCardContent(index: Int) -> String{
    return "🐤"
}

// sometimes viewmodel create it's own model
class EmojiMemoryGame : ObservableObject{
    private static let emojis = ["👩‍🚀", "👩‍🌾", "👨‍🚒", "🦸‍♀️", "🎅" , "🦊", "🐶", "🐴", "🐏", "🐇", "🐔", "🐱","🐤", "🦄", "🦋", "🦖", "🦏", "🐐", "🐩", "🌵", "🪵", "🐉", "🐲", "🐢"]
    
    // private(set)can be shown without editing
    // also private model protect it fromm any Views trying to reaching in
    // and trying to change things
    
   private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairesOfCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
     
   @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    //to prevent anyone from changes the model from outside ViewModel
    //ReadOnly
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
