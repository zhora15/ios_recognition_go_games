//
//  GamesSelector.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct GamesSelector: View {
    
    let games = ["All", "My", "Shared"]
    
    @Binding var selectedGamesScreen: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<games.count) { index in
                Button(action: {
                    selectedGamesScreen = index
                }) {
                    Text(games[index])
                        .multilineTextAlignment(.center)
                        .foregroundColor(selectedGamesScreen == index ? .gray : .black)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 10)
                }
                if index < games.count-1 {
                    Divider()
                        .frame(width: 1)
                        .background(Color.black)
                }
            }
        }
        .frame(height: 40)
        .background(Color(r: 237, g: 237, b: 237))
        .cornerRadius(15)
        .padding(.horizontal, 50)
    }
    
}
