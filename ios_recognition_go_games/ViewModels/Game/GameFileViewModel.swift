//
//  GameViewModel.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 09.03.2023.
//

import SwiftUI

class GameFileViewModel: ObservableObject {
    @Published var currentGame: Game?
    
    init(currentGame: Game? = nil) {
        self.currentGame = currentGame
    }
}
