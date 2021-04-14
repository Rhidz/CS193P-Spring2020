//
//  Deal + Modifier.swift
//  Set Assignment 03
//
//  Created by Admin on 27/03/2021.
//

import SwiftUI

struct Dealer: AnimatableModifier {
    
    @State var show: Bool = false
    var delay: Double
    var offset: CGSize
    var randomXLocation: CGFloat {
        CGFloat.random(in: -offset.width ..< offset.width)
    }
    
    func body(content: Content) -> some View {
            ZStack {
                if show {
                    content
                    .transition(.asymmetric(insertion: .offset(CGSize.init(width: randomXLocation, height:-offset.height-50)),removal: .offset(CGSize.init(width: randomXLocation, height: offset.height+50))))
                }
            }
            .onDisappear {
                withAnimation (Animation.easeInOut(duration: 1.25).delay(0))  {
                    self.show = false
                }
            }
            .onAppear {
                withAnimation (Animation.easeInOut(duration: 1.25).delay(self.delay)) {
                    self.show = true
                }
            }
        }

}

extension View {
    func deal(delay: Double, offset: CGSize) -> some View {
        self.modifier(Dealer(delay: delay, offset: offset))
    }
}
