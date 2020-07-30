//
//  ContentView.swift
//  Memorize
//
//  Created by Admin on 04/06/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

struct EmojiMemomryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(EmojiMemoryGame.theme)").padding()
                Text("Score: \(self.viewModel.score)").padding()
                Button("New Game") { self.viewModel.newGame() }.padding()
                
            }.font(Font.system(size: 20))
                .aspectRatio(contentMode: .fit)
            
           
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                
             .padding(5)
            }
            
        }
        
        .foregroundColor(EmojiMemoryGame.color)
    }
}


struct CardView : View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    func body(for size: CGSize) -> some View {
        
        ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: edgeLineWidth)
                    Text(self.card.content)
                    
                } else if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
                
            }
            .font(Font.system(size: fontSize(for: size)))
        }
        
    
    
    // MARK:- Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemomryGameView(viewModel: EmojiMemoryGame())
    }
}
