//
//  Array+Identifiable.swift
//  Memorize-Local
//
//  Created by Admin on 26/12/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        
        return nil
    }
}
