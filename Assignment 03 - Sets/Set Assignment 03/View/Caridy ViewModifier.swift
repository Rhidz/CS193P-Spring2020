
//  Caridy ViewModifier.swift
//  Memorize-Local
//  Created by Admin on 30/12/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    var isChosen: Bool
    func body(content: Content) -> some View { // content is the Zstack
        
        ZStack {
            if isFaceUp && !isChosen {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            else if isChosen {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.pink).opacity(selectedOpacity)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: selectedCard)
                content
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
        
    private let cornerRadius: CGFloat = 5.0
    private let edgeLineWidth: CGFloat = 2.0
    
    
}
