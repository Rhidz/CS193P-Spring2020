//
//  ContentView.swift
//  Set Assignment 03
//
//  Created by Admin on 26/02/2021.
//

import SwiftUI

struct SetGrid: View {
    
    @ObservedObject var viewModel: SetGameViewModel
    
    var delay: Double = 0.2
   
    @State var shouldDelay = true
    
    var body: some View {
       GeometryReader { geometry in
          ZStack {
           Color.purple.opacity(0.20).edgesIgnoringSafeArea(.all)
           VStack {
             HStack {
                    Text ("Set Game").font(.headline)
                    Spacer()
                    Button("Hints (6/2) ") {
                        print("whatever")
                    }.buttonStyle(setButtonStyle())
                }.padding() // First HStack
           
                Grid(viewModel.setCards) { card in
                    SetCardView(card: card).onTapGesture { withAnimation(Animation.spring()){
                        viewModel.choose(card: card)
                        if viewModel.chosenCards == 3 {
                           print("Hi")
                        }
                      }}
                    .padding(setCardPadding)
                        
                    .aspectRatio(1.5, contentMode: .fit)
                    .shadow(color: Color.purple.opacity(0.30), radius: 8.0)
                    .transition(AnyTransition.asymmetric(
                                    insertion: AnyTransition.offset(appear(from: geometry.size)),
                                    removal: AnyTransition.offset(dissappear(to: geometry.size))
                                   .combined(with: AnyTransition.scale(scale: 0.5))
                    ))
                    .animation(Animation.easeInOut.delay(tranisitionDelay(for: viewModel.setCards.firstIndex(matching: card) ?? 0)))
                    
                }.padding(gridPadding)
                .onAppear { withAnimation(.easeInOut(duration: 3)){
                    dealCardsOnScreen() }} // Grid
            
            HStack {
                Button("New Game") {withAnimation(.easeInOut(duration: 2)) { newGame() }}
                    .buttonStyle(setButtonStyle())
                Spacer()
                Button("Deal Cards") {withAnimation(.easeInOut(duration: 2)) { dealCardsOnScreen() }}
                    .buttonStyle(setButtonStyle())
           }.padding() // HStack
        }
    }
}
}
    private func newGame() {
        viewModel.newGame()
        shouldDelay = true
        dealCardsOnScreen()
    }
    private func dealCardsOnScreen() {
        viewModel.dealCards()
        DispatchQueue.main.async {
            shouldDelay = false
        }
    }
    private func appear(from: CGSize) -> CGSize {
        return CGSize(width: 0, height: from.height)
    }
    
   private func dissappear(to: CGSize) -> CGSize {
    return CGSize(width: CGFloat.random(in: -3*to.width...3*to.width), height: -CGFloat.random(in: -3*to.height...3*to.height))
    }
    private func tranisitionDelay(for card: Int) -> Double {
        guard shouldDelay else {
            return 0.20
        }
        return Double(card) * delay
    }
}
   


struct setButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple).opacity(0.50)
            .foregroundColor(.black)
            .cornerRadius(9.0)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGrid(viewModel: SetGameViewModel())
    }
}
extension View {
    func cardify(isFaceUp: Bool, isChosen: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isChosen: isChosen))
    }
    
}

extension AnyTransition {
    static var appearAndDissappear : AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    }
