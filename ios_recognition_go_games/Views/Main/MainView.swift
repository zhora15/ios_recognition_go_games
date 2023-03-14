//
//  MainView.swift
//  go_swiftui
//
//  Created by Георгий Сенин on 01.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = GamesViewModel()
    
    @State private var selectedTabBarItem = 0
    
    var body: some View {
        NavigationView {
            VStack {
                switch selectedTabBarItem {
                case 0:
                    GamesView()
                case 1:
                    NewView()
                case 2:
                    ProfileView()
                default:
                    GamesView()
                }
                BottomTabBar(selectedTab: $selectedTabBarItem)
            }.navigationBarTitle("", displayMode: .inline).navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


