//
//  LoginViewModel.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    func login() {
        // Perform login action
    }
    
    func validate() -> Bool {
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            return false
        }
        if password != confirmPassword {
            return false
        }
        // Add more validation rules here if needed
        return true
    }
}
