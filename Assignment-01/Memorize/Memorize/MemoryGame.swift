//
//  MemoryGame.swift
//  Memorize
//
//  Created by Admin on 04/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        if let chosenIndex = self.index(of: card){
            cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        }
        
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    init(numbersOfPairsOfCards: Int, cardContentFactory:(Int)-> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numbersOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            
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
        
        
    }
}
