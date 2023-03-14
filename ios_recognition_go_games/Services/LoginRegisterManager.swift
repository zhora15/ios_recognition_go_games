//
//  LoginRegisterManager.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 04.03.2023.
//

import SwiftUI

class LoginRegisterManager: ObservableObject {
    @Published var isLoggedIn = false
    
    func login() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                self.isLoggedIn = true
            }
        }
    }
    
    func register() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                self.isLoggedIn = true
            }
        }
    }
}
