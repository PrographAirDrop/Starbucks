//
//  MainTabView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/07.
//

import SwiftUI

struct MainTabView: View {
  var body: some View {

    NavigationView {
      TabView {
        HomeView()
          .tabItem {
            Image("tabitem.home")
            Text("홈")
          }
        
        OrderView(viewModel: OrderViewModel())
          .tabItem {
            Image("tabitem.order")
            Text("주문")
          }
        
        MyMenuView()
          .tabItem {
            Image("tabitem.home.mymenu")
            Text("나의메뉴")
          }
        
        CartView()
          .tabItem {
            Image("tabitem.cart")
            Text("장바구니")
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
