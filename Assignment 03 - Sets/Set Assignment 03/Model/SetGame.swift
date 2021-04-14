
import Foundation

struct SetGame <CardContent> {
    private(set) var deck: Array<SetGameCard>
    
    private var cardCount: Int = 17
    
    var chosenCardCount: Int = 0
    
    var displayCards: Array<SetGameCard> { deck.filter { $0.isOnScreen } } // computed properties run after self is available. Interesting.
   
    private var startOfGame = false
 
    init(count: Int, combinations: (Int) -> (CardContent)) {
        deck = Array<SetGameCard>()
        for index in 0..<count {
            let card = SetGameCard(cardContent: combinations(index), id: index)
            deck.append(card)
        }
        deck.shuffle()
        
        startOfGame = true
        
     }
    
    mutating func choose(card: SetGameCard) {
        if let index = deck.firstIndex(matching: card) {
            if !deck[index].isSelected {
                deck[index].isSelected = true
                chosenCardCount = chosenCardCount + 1
            }
            else if deck[index].isSelected && chosenCardCount != 3 {
                deck[index].isSelected = false
                chosenCardCount = chosenCardCount - 1
            }
        }
    }
  
    mutating func dealCards() {
       
        if !deck.isEmpty {
            if startOfGame {
                for index in 0...cardCount {
                    deck[index].isOnScreen = true
                }
                startOfGame = false
                cardCount = cardCount + 1
            }
            else if cardCount != 81 {
                 for _ in 0..<3 {
                    if !deck[cardCount].isMatched {
                    deck[cardCount].isOnScreen = true
                    cardCount = cardCount + 1
                    }
                 }
            }
            else {
                print("maximum limit reached")// Pop up or some way to let the user know
            }
           }
        
        else {
            print("Empty Deck")// Pop up or some way to let the user know
        }
        
    }
    
    
    mutating func match(cards: [SetGameCard], results: [Bool]) {
        
        if results.allSatisfy({!$0}) {
            for indice in cards.indices {
                let card = deck.firstIndex(matching: cards[indice])
                deck[card!].isSelected = false
            }
            
        }
            else {
                for indice in cards.indices {
                    let card = deck.firstIndex(matching: cards[indice])
                    deck[card!].isMatched = true
                    deck[card!].isOnScreen = false
                     
                }
            }
        chosenCardCount = 0
        }
         
    
    
    struct SetGameCard: Identifiable {
        var isMatched = false
        var isSelected = false
        var cardContent: CardContent
        var id: Int
        var isOnScreen = false
    }
   }

     

