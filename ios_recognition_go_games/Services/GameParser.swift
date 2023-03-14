//
//  GameParser.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 09.03.2023.
//

import Foundation

final class GameParser {
    private let sgf: String
    
    init(sgf: String) {
        self.sgf = sgf
    }
    
    func parseSGF() -> Game? {
        let lines = sgf.components(separatedBy: .newlines)
        var boardSize: Int?
        var gameName: String?
        var moves: [Stone]?
        
        for line in lines {
            var strippedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
            if strippedLine.isEmpty || strippedLine.first == ")" { continue }
            if strippedLine.first == "(" {
                let tokens = strippedLine.components(separatedBy: "[")
                guard tokens.count == 8 else { continue }
                
                let size = tokens[5]
                if size[size.index(size.startIndex, offsetBy: 1)] != "[" {
                    boardSize = Int("\(size[size.startIndex])\(size[size.index(size.startIndex, offsetBy: 1)])")
                }
                
                let name = tokens[6]
                if let closingBracketIndex = name.firstIndex(of: "]") {
                    gameName = String(name[name.startIndex..<closingBracketIndex])
                }
            } else if strippedLine.first == ";" {
                strippedLine = String(strippedLine.dropFirst(1))
                let color = String(strippedLine[strippedLine.startIndex])
                let x = Int(strippedLine[strippedLine.index(strippedLine.startIndex, offsetBy: 2)].asciiValue! - 96)
                let y = Int(strippedLine[strippedLine.index(strippedLine.startIndex, offsetBy: 3)].asciiValue! - 96)
                moves = (moves ?? []) + [Stone(x: x, y: y, colorLetter: color)]
            }
            
        }
        
        return Game(title: gameName, date: Date(), moves: moves, boardSize: boardSize)
    }
    
}
