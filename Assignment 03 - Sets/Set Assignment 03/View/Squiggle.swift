//
//  Squiggle.swift
//  Set Assignment 03
//
//  Created by Admin on 12/03/2021.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY * 0.20))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 0.85))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.85))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY * 0.20))
        
        return path
    }
    
    
    
}
