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
         HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
         .padding()
         .foregroundColor(Color.orange)
         .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
        
        
        /* Properties gets passed down to its contents*/
        /* HStack has a spacing thingy
           Don't put in vars in view builder.
         
         
         */
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                if card.smallFontSize {
                    Text(card.content).font(Font.title)
                }
                else {
                    Text(card.content).font(Font.largeTitle)
                    
                }
                
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
            
        }
    }
}

















































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemomryGameView(viewModel: EmojiMemoryGame())
    }
}
