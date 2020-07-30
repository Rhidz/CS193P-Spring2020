//
//  MemoryGame.swift
//  Memorize
//
//  Created by Admin on 04/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var score: Int = 0
    
    var indexOfOneAndOnlyCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue  /* IF index == newValue THEN SET ALL
                  THE CARD FACE UP ELSE SET THE CARDS FACE DOWN */
             }
        }
    }
    
    mutating func choose(card: Card){
        //print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card),!cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            
            cards[chosenIndex].numberOfTimesSeen += 1
            
            if let potentialMatchIndex = indexOfOneAndOnlyCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    
                }
                else {
                    if cards[chosenIndex].numberOfTimesSeen > 1 && cards[potentialMatchIndex].numberOfTimesSeen > 1 {
                        score += -2
                        
                  }
                    else {
                        if  cards[chosenIndex].numberOfTimesSeen > 1  || cards[potentialMatchIndex].numberOfTimesSeen > 1 {
                            score = score - 1
                    }
                  }
                }
               self.cards[chosenIndex].isFaceUp = true
                 
            } else {
                 indexOfOneAndOnlyCard = chosenIndex
            }
         }
   }
    init(numbersOfPairsOfCards: Int, cardContentFactory:(Int,Int)-> CardContent) {
        cards = Array<Card>()
        let chosenTheme = Int.random(in: 0...5)
        for pairIndex in 0..<numbersOfPairsOfCards {
            let content = cardContentFactory(pairIndex,chosenTheme)
            
            if numbersOfPairsOfCards < 5 {
                cards += [Card(id: pairIndex*2, content: content), Card(id: pairIndex*2 + 1, content: content)]
            }
            else {
                cards += [Card(id: pairIndex*2, content: content, smallFontSize: true), Card(id: pairIndex*2 + 1, content: content, smallFontSize: true)]
            }
         }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var smallFontSize: Bool = false
        var numberOfTimesSeen: Int = 0
        
        
        
    }
}
  // MARK: OLD WAY OF func choose()
/* if let chosenIndex: Int = cards.firstIndex(matching: card),!cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
   if let potentialMatchIndex = indexOfOneAndOnlyCard {
       if cards[chosenIndex].content == cards[potentialMatchIndex].content {
           cards[chosenIndex].isMatched = true
           cards[potentialMatchIndex].isMatched = true
           
       }
       indexOfOneAndOnlyCard = nil
   } else {
       for index in cards.indices {
           cards[index].isFaceUp = false
       }
       indexOfOneAndOnlyCard = chosenIndex
   }
   
   self.cards[chosenIndex].isFaceUp = true
}*/
