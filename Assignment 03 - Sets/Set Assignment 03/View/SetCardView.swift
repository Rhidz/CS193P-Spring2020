import SwiftUI

struct SetCardView: View {
    var card: SetGame<SetCardContent>.SetGameCard
    var bodySize: CGSize = CGSize(width: 0, height: 0)
    
    
   var color: Color { // needs to conform to Shapestyle
        switch card.cardContent.color.rawValue {
        case 1 :
            return .red
        case 2 :
            return .green
        case 3 :
            return .blue
        default:
            return .yellow
        }
    }
    
    var body: some View {
         if card.isOnScreen &&  !card.isMatched  {
            GeometryReader { geometry in
                
                    HStack {
                        ForEach(0..<card.cardContent.rank.rawValue) { index in
                            shape(for: card.cardContent.shape.rawValue)
                                .frame(width: (geometry.size.width * 0.75)/3, height: geometry.size.height * 0.80, alignment: .center)
                         }
                     }
                .cardify(isFaceUp: card.isOnScreen, isChosen: card.isSelected)
                .foregroundColor(.purple).opacity(foregroundOpacity)
            }
         }
    }
   @ViewBuilder
    private func shape(for shape: Int) -> some View {
        if shape == 3 { Diamond().fill(with: card.cardContent.fill.rawValue, for: color) }
        if shape == 2 { Capsule().fill(with: card.cardContent.fill.rawValue, for: color) }
        if shape == 1 { Triangle().fill(with: card.cardContent.fill.rawValue, for: color) }
    }
}
 
extension Shape {
    @ViewBuilder
    func fill(with style: Int, for color: Color) -> some View {
        if style == 2 { self.fill(color) }
        if style == 1 { self.fill(color).opacity(fillOpacity) }
        if style == 3 { self.stroke(color, lineWidth: strokeLineWidth) }
    }
}
/* ZStack {
 shape(for: card.cardContent.shape.rawValue )
      }.cardify(isFaceUp: card.isOnScreen)
      .foregroundColor(.gray).opacity(0.60)*/
