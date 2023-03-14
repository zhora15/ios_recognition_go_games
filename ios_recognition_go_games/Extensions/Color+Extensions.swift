//
//  Color+Extension.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            self.init(
                red: Double((hexNumber & 0xff0000) >> 16) / 255.0,
                green: Double((hexNumber & 0x00ff00) >> 8) / 255.0,
                blue: Double((hexNumber & 0x0000ff)) / 255.0
            )
            return
        }

        self.init(red: 0, green: 0, blue: 0)
    }
    init(r: Double, g: Double, b: Double) {
        self.init(red: r/255, green: g/255, blue: b/255)
    }
}
