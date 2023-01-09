//
//  MemoryGame.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 05/01/2023.
//

import Foundation


struct MemoryGame<CardContent>{
   private(set) var cards: Array<Card>
     
    
    func choose(){
        
    }
    
    init(numberOfPairesOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairesOfCards {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    // we can put card s truct outside MemoryGame put we specify that card is linked to the MemoryGame
    struct Card{
        var isFaceUP: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
