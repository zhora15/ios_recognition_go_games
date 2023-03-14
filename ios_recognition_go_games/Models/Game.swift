//
//  Game.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import Foundation

struct Game: Identifiable {
    let id = UUID()
    let title: String?
    let date: Date?
    let moves: [Stone]?
    let boardSize: Int?
    
    var stringDate: String {
        guard let date = date else {
            return "-"
        }
        
        return date.convertDateToString()
        
        
    }
}
