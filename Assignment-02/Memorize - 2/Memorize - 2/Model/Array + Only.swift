//
//  Array + Only.swift
//  Memorize - 2
//
//  Created by Admin on 25/07/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
extension Array {
    var only: Element? {
        count == 1 ? first : nil  /* IF COUNT == 1 THEN RETURN FIRST OR NIL*/
    }
}
