//
//  CustomList.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct GameCell: View {
    let game: Game
    
    var body: some View {
        HStack(spacing: 16) {
            Image("test")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
            VStack(alignment: .leading, spacing: 12) {
                Text(game.title ?? "Game #\(game.id)")
                    .font(.headline)
                    .padding(.top, 10)
                Text(String(game.stringDate))
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
