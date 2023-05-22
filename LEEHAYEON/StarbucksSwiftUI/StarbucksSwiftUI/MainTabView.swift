//
//  MainTabView.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/04/29.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        
        UITabBar.appearance().backgroundColor = UIColor.white
        
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.systemGray6 // BFBFBF IconSecondary 수정이 필요
        appearance.backgroundImage = UIImage()
        
        UITabBar.appearance().standardAppearance = appearance
    }
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            
            HomeView()
                .tabItem({
                    Image("tabitem.home")
                    Text("홈")
                })
                .tag(0)
            
            OrderView()
                .tabItem({
                    Image("tabitem.order")
                    Text("주문")
                })
                .tag(1)
            
            MyMenuView()
                .tabItem({
                    Image("tabitem.home.mymenu")
                    Text("나의메뉴")
                })
                .tag(2)
            
            BasketView()
                .tabItem({
                    Image("tabitem.cart")
                    Text("장바구니")
                })
                .tag(3)
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

