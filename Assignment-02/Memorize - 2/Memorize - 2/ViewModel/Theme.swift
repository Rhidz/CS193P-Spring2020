//
//  Theme.swift
//  Memorize - 2
//
//  Created by Admin on 25/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var color: Color
    var emoji: [String]
    
    init(name: String, color: Color, emoji: [String]) {
        self.name = name
        self.color = color
        self.emoji = emoji
    }
}
