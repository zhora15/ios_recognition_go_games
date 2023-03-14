//
//  GameListViewModel.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 12.03.2023.
//

import SwiftUI

class GameListViewModel: ObservableObject {
    @Published var currentGame: Game?
    
    init(currentGame: Game? = nil) {
        self.currentGame = currentGame
    }
}
