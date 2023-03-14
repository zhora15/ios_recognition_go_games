//
//  GameListView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 12.03.2023.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var viewModel: GameListViewModel
    @State private var moves: Int = 0
    @State private var gameProgress: Double = 0
    @State private var currentStonesOnBoardArray: [Stone] = []
    
    private var currentMoveNum: Int {
        Int(round(gameProgress*Double(moves)))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let game = checkGame() {
                HStack(spacing: UIScreen.screenWidth/7) {
                    HStack() {
                        Text(game.title!).font(.title2).bold().multilineTextAlignment(.leading)
                        Spacer()
                    }.frame(width: UIScreen.screenWidth/1.5)
                    Button {
                        //edit action
                    } label: {
                        Image(systemName: "pencil").resizable().frame(width: 25, height: 25).foregroundColor(.black)
                    }
                }.padding(.horizontal, 40).padding(.top, 20)
                GoBoard(boardSize: game.boardSize!, stonesArray: $currentStonesOnBoardArray).scaleEffect(0.75)
                HStack(){
                    Text("Date: \(game.stringDate)")
                    Spacer()
                }.padding(.horizontal, UIScreen.screenWidth*0.125).padding(.bottom, 50)
                Text("\(currentMoveNum)").padding(.bottom, 10).foregroundColor(.gray)
                Slider(value: $gameProgress) { didchange in
                    if currentMoveNum == 0{
                        currentStonesOnBoardArray = []
                    } else if currentMoveNum <= moves {
                        currentStonesOnBoardArray=Array(game.moves![0...currentMoveNum-1])
                    }
                }.tint(Color(r:208, g: 189, b: 131)).padding(.horizontal, UIScreen.screenWidth*0.125).padding(.bottom, 20)
                HStack(spacing: UIScreen.screenWidth*0.125) {
                    Button {
                        gameProgress=max(                        gameProgress-Double(1/Double(moves)),0)
                        if currentMoveNum == 0{
                            currentStonesOnBoardArray = []
                        } else if currentMoveNum >= 0 {
                            currentStonesOnBoardArray=Array(game.moves![0...currentMoveNum-1])
                        }
                    } label: {
                        Image(systemName: "arrow.left").foregroundColor(.black)
                    }
                    Button {
                        gameProgress=min(gameProgress+Double(1/Double(moves)), 1)
                        if currentMoveNum == 0{
                            currentStonesOnBoardArray = []
                        } else if currentMoveNum <= moves {
                            currentStonesOnBoardArray=Array(game.moves![0...currentMoveNum-1])
                        }
                    } label: {
                        Image(systemName: "arrow.right").foregroundColor(.black)
                    }
                }
                Spacer()
            } else {
                Text("Error while opening game info.")
            }
            
        }.onAppear {
            moves = (viewModel.currentGame?.moves?.count)!
        }
    }
    
    private func checkGame() -> Game?{
        if let game = viewModel.currentGame {
            guard let title = game.title, let boardSize = game.boardSize, let moves = game.moves, let date = game.date else {
                return Game(title: "N/D", date: Date(), moves: [], boardSize: 9)
            }
            return Game(title: title, date: date, moves: moves, boardSize: boardSize)
        }
        return nil
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(viewModel: GameListViewModel(currentGame: Game(title: "AlphaGo Zero vs AlphaGo Master Game 1", date: Date(), moves: nil, boardSize: 19)))
    }
}

