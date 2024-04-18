//
//  MainTabView.swift
//  AirBnBClone
//
//  Created by Pankaj Sachdeva on 13.04.24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            
            WishListView()
                .tabItem { Label("Wishlists", systemImage: "heart") }
            
            TripsView()
                .tabItem { Label("Trips", systemImage: "person") }
            
            InboxView()
                .tabItem { Label("Inbox", systemImage: "person") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
