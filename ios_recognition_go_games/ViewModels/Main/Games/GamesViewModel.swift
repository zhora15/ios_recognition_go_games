//
//  GamesViewModel.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import Foundation

class GamesViewModel: ObservableObject {
    
    @Published var gamesList: [Game] = []
    var str = """
    (;GM[1]FF[4]CA[UTF-8]AP[Zhora's recognizer:video2sgf.ru]SZ[19]GN[Example]US[Zhora's recognizer]
        ;B[mj]
        ;W[dp]
        ;B[gj]
        ;W[dd]
        ;B[jg]
        ;W[pp]
        ;B[jm]
        ;W[pd]
        ;B[cn]
        ;W[co]
        ;B[dn]
        ;W[fp]
        ;B[df]
        ;W[cf]
        ;B[ce]
        ;W[de]
        ;B[cd]
        ;W[dg]
        ;B[ef]
        ;W[cg]
        ;B[dc]
        ;W[cj]
        ;B[fc]
        ;W[pj])
    """
    func fetchGames() {
        gamesList = []
        gamesList.append(GameParser(sgf: str).parseSGF()!)
        gamesList.append(Game(title: "Game 1", date: Date(), moves: [], boardSize: 19))
        gamesList.append(Game(title: "Game 2", date: Date(), moves: [], boardSize: 19))
        gamesList.append(Game(title: "Game 3", date: Date(), moves: [], boardSize: 13))
        gamesList.append(Game(title: "Game 1", date: Date(), moves: [], boardSize: 13))
        gamesList.append(Game(title: "Game 2", date: Date(), moves: [], boardSize: 9))
        gamesList.append(Game(title: "Game 3", date: Date(), moves: [], boardSize: 9))
    }
    
}
