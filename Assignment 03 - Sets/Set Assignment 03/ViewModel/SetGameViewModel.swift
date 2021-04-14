
import Foundation
class SetGameViewModel: ObservableObject {
    //MARK: MODEL AND SET CARDS
    @Published private var model:SetGame = SetGameViewModel.createSetGame()
    
    var chosenCards: Int {
        model.chosenCardCount
    }
    
    var setCards:Array<SetGame<SetCardContent>.SetGameCard> {  model.displayCards  }
    
    private static func createSetGame() -> SetGame<SetCardContent> {
        let cardContents = combinations()
        return SetGame(count: cardContents.count) {cardContents[$0]}
    }
  // MARK: COMBINATIONS
    private static var combinations:() -> Array<SetCardContent> = {
        let card = SetCardContent.self
        var cards = Array<SetCardContent>()
        for color in card.Color.allCases {
            for rank in card.Rank.allCases {
                for fill in card.FillStyle.allCases {
                    for shape in card.Shape.allCases {
                        cards.append(SetCardContent(color: color, rank: rank, fill: fill, shape: shape))
                    }
                }
            }
          }
        return cards
   }
    
    func choose(card: SetGame<SetCardContent>.SetGameCard) {
        if chosenCards == 3 && !card.isSelected {
            checkContents()
            model.choose(card: card)
         }
        else {
            model.choose(card: card)
        }
    }
     //private var compare: (Int, Int, Int) -> Bool = { ($0 == $1 && $1 == $2 )}
   
   private func checkContents() {
        let cards = model.deck.filter{$0.isSelected && !$0.isMatched}
        
        var cardContents = [(Int, Int, Int, Int)]()
        
        for index in cards.indices {
            let content = (cards[index].cardContent.color.rawValue, cards[index].cardContent.shape.rawValue,cards[index].cardContent.rank.rawValue,cards[index].cardContent.fill.rawValue)
            cardContents.append(content)
            
        }
      
    
         model.match(cards: cards, results: [true])
    }
    
    func dealCards() {
         model.dealCards()
        
    }
    func newGame() {
        model = SetGameViewModel.createSetGame()
        
    }
    
}


