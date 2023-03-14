//
//  GamesView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct GamesView: View {
    
    @StateObject private var viewModel = GamesViewModel()
    
    @State private var selectedGamesScreen = 0
    
    var body: some View {
        VStack {
            GamesSelector(selectedGamesScreen: $selectedGamesScreen)
            List {
                ForEach(viewModel.gamesList, id: \.id) { game in
                    NavigationLink(destination: GameListView(viewModel: GameListViewModel(currentGame: game))) {
                        GameCell(game: game).listRowSeparator(.hidden)
                    }
                }
            }.listStyle(.plain)
        }
        .onAppear {
            viewModel.fetchGames()
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}

