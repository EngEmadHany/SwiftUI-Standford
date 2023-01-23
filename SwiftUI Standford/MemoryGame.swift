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
         // build up an array that has all the faceUp Card indecies in it and return index of the card that's isFaceUP
        get { cards.indices.filter({ cards[$0].isFaceUP }).oneAndOnly }
        set { cards.indices.forEach{cards[$0].isFaceUP = ($0 == newValue) } } }
    
    
   mutating func choose(_ card: Card){
       if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }),
          !cards[chosenIndex].isFaceUP,
          !cards[chosenIndex].isMatched
       {
        
           if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
               
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               cards[chosenIndex].isFaceUP = true
           } else {
               
            indexOfTheOneAndOnlyFaceUpCard = chosenIndex
           }
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
        var isFaceUP: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


extension Array{
    // this should return what's in the array if it's one and onlyOne in the Array
    var oneAndOnly: Element?{
        if self.count == 1 {
            return self.first
        }else{
            return nil
        }
    }
    
}
