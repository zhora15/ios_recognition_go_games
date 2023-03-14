//
//  TabBar.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct BottomTabBar: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .frame(height: 1)
                .background(Color.black)
            HStack(spacing: 0) {
                Button(action: {
                    selectedTab = 0
                }) {
                    Text("Games")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(selectedTab == 0 ? Color(r: 176, g: 176, b: 176) : Color.clear)
                        .edgesIgnoringSafeArea(.bottom)
                }
                Divider()
                    .frame(width: 1)
                    .background(Color.black)
                Button(action: {
                    selectedTab = 1
                }) {
                    Text("New")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(selectedTab == 1 ? Color(r: 176, g: 176, b: 176) : Color.clear)
                        .edgesIgnoringSafeArea(.bottom)
                }
                Divider()
                    .frame(width: 1)
                    .background(Color.black)
                Button(action: {
                    selectedTab = 2
                }) {
                    Text("Profile")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(selectedTab == 2 ? Color(r: 176, g: 176, b: 176) : Color.clear)
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
        .frame(height: 50)
        .background(Color(r: 217, g: 217, b: 217))
    }
}

