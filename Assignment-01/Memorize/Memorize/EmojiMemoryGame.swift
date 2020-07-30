//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Admin on 04/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

/* View Model*/
/* It is a class since it can be shared */

/* Constraints and gains. Constraints are quite like protocols
 access the model using
 model is private to the class EmojiMemoryGame
 Analogy glass door */

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","👺","🕷","🧛🏻‍♀️"]
        return MemoryGame<String>(numbersOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
     
    //MARK:- Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
  
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
extension Int {
    
}
