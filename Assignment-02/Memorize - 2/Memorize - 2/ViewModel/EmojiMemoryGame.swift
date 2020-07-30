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

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static var theme : String = ""
    
    static var color: Color = Color.orange
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["Halloween": ["👻","🎃","👺","🕷","🧛🏻‍♀️","👽","🤖"],
                      "Foods":     ["🥞","🍕","🌮","🍔","🍟","🧁","🍰"],
                      "Sports":    ["⚽️","🏀","🏓","🏸","🎾","🏏","🎱"],
                      "FairyLand": ["🧝🏻‍♀️","🧚‍♀️","🧜🏻‍♀️","🧖‍♀️","🧞‍♂️","👰","👼🏻"],
                      "Fruits":    ["🍏","🍉","🍇","🥭","🍒","🍓","🍍"],
                      "Weather":   ["🌕","⛅️","🌈","🌙","❄️","☔️","☃️"]
        ]
        let colors: [Color] = [Color.orange, Color.purple, Color.green, Color.blue, Color.red, Color.yellow, Color.gray]
        var themes: [Theme] {
            var localTheme: [Theme] = []
            var count = 0
            for key in emojis.keys {
                let theme = Theme(name:key, color: colors[count], emoji: emojis[key]!)
                localTheme.append(theme)
                count += 1
            }
            return localTheme
        }
        return MemoryGame<String>(numbersOfPairsOfCards: Int.random(in: 4...7)){ pairIndex,chosenTheme in
            theme = themes[chosenTheme].name
            color = themes[chosenTheme].color
            return themes[chosenTheme].emoji[pairIndex]
        }
    }
    //MARK:- Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    var score: Int {
        model.score
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card: card)
    }
}
/* Constraints and gains. Constraints are quite like protocols
access the model using
model is private to the class EmojiMemoryGame
Analogy glass door */
