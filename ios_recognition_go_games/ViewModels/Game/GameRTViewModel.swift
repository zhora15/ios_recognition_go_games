//
//  GameRTViewModel.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 09.03.2023.
//

import Foundation

class GameRTViewModel: ObservableObject {
    @Published var currentGame: Game?
    
    init(currentGame: Game? = nil) {
        self.currentGame = currentGame
    }
}
