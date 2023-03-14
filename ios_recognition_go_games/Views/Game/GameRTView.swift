//
//  GameView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 06.03.2023.
//

import SwiftUI

struct GameRTView: View {
    
    @ObservedObject var viewModel: GameRTViewModel
    @State var gameProgress: Double = 0.78
    
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
//                GoBoard(boardSize: game.boardSize!, stonesArray: [
//                                Stone(x: 2, y: 2, colorLetter: "B"),
//                                Stone(x: 4, y: 5, colorLetter: "W"),
//                                Stone(x: 5, y: 8, colorLetter: "B")
//                ]).scaleEffect(0.75)
                HStack(){
                    Text("Date: \(game.stringDate)")
                    Spacer()
                }.padding(.horizontal, UIScreen.screenWidth*0.125).padding(.bottom, 50)
                Text("\(Int(round(gameProgress*100)))%").padding(.bottom, 10).foregroundColor(.gray)
                ProgressView(value: gameProgress).tint(Color(r: 208, g: 189, b: 131)).padding(.horizontal, UIScreen.screenWidth*0.125)
                Spacer()
            } else {
                Text("Error while opening game info.")
            }
            
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

struct GameRTView_Previews: PreviewProvider {
    static var previews: some View {
        GameRTView(viewModel: GameRTViewModel(currentGame: Game(title: "AlphaGo Zero vs AlphaGo Master Game 1", date: Date(), moves: nil, boardSize: 19)))
    }
}
