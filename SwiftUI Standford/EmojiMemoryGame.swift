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
class EmojiMemoryGame{
     static let emojis = ["👩‍🚀", "👩‍🌾", "👨‍🚒", "🦸‍♀️", "🎅" , "🦊", "🐶", "🐴", "🐏", "🐇", "🐔", "🐱","🐤", "🦄", "🦋", "🦖", "🦏", "🐐", "🐩", "🌵", "🪵", "🐉", "🐲", "🐢"]
    
    // private(set)can be shown without editing
    // also private model protect it fromm any Views trying to reaching in
    // and trying to change things
    
   static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairesOfCards: 4) { pairIndex in
                emojis[pairIndex]
        }
    }
     
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
