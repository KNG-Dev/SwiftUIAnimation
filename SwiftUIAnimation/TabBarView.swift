//
//  TabBarView.swift
//  SwiftUIAnimation
//
//  Created by Kenny Ho on 10/28/19.
//  Copyright © 2019 Kenny Ho. All rights reserved.
//

import SwiftUI
/*
 TabBar to show Twitter's Home Page, Twitter Search Page, & Facebook Home Page
 */

struct TabBarView: View {
    @Binding var state: Bool
    @Binding var showSetting: Bool
    @Binding var showMenu: Bool

    var body: some View {
        TabView {
            TwitterNavView(state: $state, showSetting: $showSetting, showMenu: $showMenu)

            TwitterSearchView().tabItem({
                Image(systemName: "magnifyingglass")
                Text("Search")
            })
                .tag(2)

            FacebookHomeView().tabItem({
                Image("facebookIcon-1")
                Text("Facebook")
            })
                .tag(3)
        }
        .edgesIgnoringSafeArea(.top)

        .offset(x: showMenu ? UIScreen.main.bounds.width - 92 : 0)
        .animation(.easeInOut(duration: 0.3))
    }
}

