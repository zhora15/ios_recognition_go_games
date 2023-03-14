//
//  ProfileView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            HStack() {
                Text("Kostya Lyudikaynen")
                    .font(.title3)
                Spacer()
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 75, height: 75)
            }.padding(EdgeInsets(top: 0, leading: 40, bottom: 70, trailing: 40))
            VStack {
                VStack(alignment: .leading) {
                    TextField("email", text: $viewModel.email)
                        .padding(.trailing, 16)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                        .padding(.trailing, 100)
                    Text("Email").padding(.leading).foregroundColor(.gray)
                }.padding(.bottom, 20)
                VStack(alignment: .leading) {
                    TextField("email", text: $viewModel.username)
                        .padding(.trailing, 16)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.black)
                        .padding(.trailing, 100)
                    Text("Username").padding(.leading).foregroundColor(.gray)
                }
            }.padding(.horizontal, 40)
        }
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


