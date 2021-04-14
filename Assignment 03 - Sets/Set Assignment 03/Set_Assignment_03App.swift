//
//  Set_Assignment_03App.swift
//  Set Assignment 03
//
//  Created by Admin on 26/02/2021.
//

import SwiftUI

@main
struct Set_Assignment_03App: App {
    var body: some Scene {
        WindowGroup {
            SetGrid(viewModel: SetGameViewModel())
            
        }
    }
}
