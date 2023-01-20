//
//  MemoryGame.swift
//  SwiftUI Standford
//
//  Created by Emad Hany Isaac on 05/01/2023.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
   private(set) var cards: Array<Card>
     
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get {// build up an array that has all the faceUp Card indecies in it
            let faceUpCardIndices = cards.indices.filter({ index in cards[index].isFaceUP })
            
            if faceUpCardIndeces.count == 1{
                return faceUpCardIndeces.first
            }else{
                return nil
            }
        }
        set {
            for index in cards.indices{
                if index != newValue {
                    cards[index].isFaceUP = false
                }  else{
                    cards[index].isFaceUP = true
                }
            }
        }
    }
    
   mutating func choose(_ card: Card){
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }),
          !cards[chosenIndex].isFaceUP,
          !cards[chosenIndex].isMatched
       {
        print("checkpoint 1")
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
               
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               cards[chosenIndex].isFaceUP = true
           } else {
               
               
               
               
           }
           cards[chosenIndex].isFaceUP.toggle()
       }
    }
    
    
    init(numberOfPairesOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        
        for pairIndex in 0..<numberOfPairesOfCards {
            let cardContent = createCardContent(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex*2))
            cards.append(Card(content: cardContent, id: pairIndex*2+1))
        }
        
        for index in cards.indices{
            print("hey \(index)\(cards[index])")
        }
    }
    // we can put card s truct outside MemoryGame put we specify that card is linked to the MemoryGame
    struct Card: Identifiable {
        var isFaceUP: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
