//
//  MemoryGame.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 05/01/2023.
//

import Foundation


struct MemoryGame<CardContent>{
   private(set) var cards: Array<Card>
     
    
   mutating func choose(_ card: Card){
//       if let chosenIndex = index(of: card){
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }){
           
           cards[chosenIndex].isFaceUP.toggle()
       }
    }
    
    
    init(numberOfPairesOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairesOfCards {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex*2))
            cards.append(Card(content: cardContent, id: pairIndex*2+1))
        }
    }
    // we can put card s truct outside MemoryGame put we specify that card is linked to the MemoryGame
    struct Card: Identifiable {
        var isFaceUP: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
