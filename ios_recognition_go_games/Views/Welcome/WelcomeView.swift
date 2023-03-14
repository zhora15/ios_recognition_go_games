//
//  WelcomeView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 04.03.2023.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var loginManager = LoginRegisterManager()
    // 0 - логин, 1 - регистрация
    @State private var currentOperation = 0
    
    var body: some View {
        if loginManager.isLoggedIn {
            MainView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.move(edge: .leading)).preferredColorScheme(.light)
        } else {
            switch currentOperation {
            case 0:
                LoginView(loginManager: loginManager)
                    .frame(maxWidth: .infinity, maxHeight: .infinity).preferredColorScheme(.light)
                HStack() {
                    Text("No account?")
                    Button(action: {
                        currentOperation = 1
                    }) {
                        Text("Register")
                            .foregroundColor(.black)
                    }
                }
            case 1:
                RegisterView(loginManager: loginManager)
                    .frame(maxWidth: .infinity, maxHeight: .infinity).preferredColorScheme(.light)
                Spacer()
                HStack() {
                    Text("Already register?")
                    Button(action: {
                        currentOperation = 0
                    }) {
                        Text("Log in")
                            .foregroundColor(.black)
                    }
                }
            default:
                LoginView(loginManager: loginManager)
                    .frame(maxWidth: .infinity, maxHeight: .infinity).preferredColorScheme(.light)
                Spacer()
                HStack() {
                    Text("No account?")
                    Button(action: {
                        currentOperation = 1
                    }) {
                        Text("Register")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
