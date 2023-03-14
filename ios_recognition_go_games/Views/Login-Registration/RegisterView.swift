//
//  RegistrationView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = RegistrationViewModel()
    @ObservedObject var loginManager: LoginRegisterManager
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Register")
                    .font(.largeTitle)
                    .padding(.bottom, 50)
                
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom, 15)
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom, 15)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .padding(.bottom, 40)
                
                Button(action: {
//                    if viewModel.validate() {
                        loginManager.login()
//                    }
                }) {
                    Text("Sign up")
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color(r: 209, g: 209, b: 209))
                }
            }.padding(EdgeInsets(top: 0, leading: 40, bottom: 30, trailing: 40))
            HStack {
                VStack{
                    Divider()
                        .frame(height: 1)
                        .background(Color.black)
                    
                }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                Text("or")
                    .font(.system(size: 25))
                VStack{
                    Divider()
                        .frame(height: 1)
                        .background(Color.black)
                }.padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
            }.padding(.bottom, 20)
            HStack(spacing: 30){
                Button(action: {
                    // Handle button tap
                }) {
                    ZStack {
                        Circle()
                            .fill(Color(r: 217, g: 217, b: 217))
                            .frame(width: 35, height: 35)
                        Text("G")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                }
                Button(action: {
                    // Handle button tap
                }) {
                    ZStack {
                        Circle()
                            .fill(Color(r: 217, g: 217, b: 217))
                            .frame(width: 35, height: 35)
                        Text("T")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                }
                Button(action: {
                    // Handle button tap
                }) {
                    ZStack {
                        Circle()
                            .fill(Color(r: 217, g: 217, b: 217))
                            .frame(width: 35, height: 35)
                        Text("F")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                }
            }
            Spacer()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(loginManager: LoginRegisterManager())
    }
}
