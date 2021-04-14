//
//  SetViewCard.swift
//  Set Assignment 03
//
//  Created by Admin on 26/02/2021.
//

import Foundation

struct SetCardContent {
    var color: Color
    var rank: Rank
    var fill: FillStyle
    var shape: Shape
    
    enum Color: Int, CaseIterable {
        case red = 1, green, blue
    }
    
    enum Rank: Int, CaseIterable {
        
        case one = 1, two, three
    }
    
    enum Shape: Int, CaseIterable {
        case triangle = 1, capsule, diamond
     }
    
    enum FillStyle: Int, CaseIterable {
        case striped = 1, fill, stroke
    }
}
