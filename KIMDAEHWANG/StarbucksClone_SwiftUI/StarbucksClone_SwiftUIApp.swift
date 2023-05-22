//
//  StarbucksClone_SwiftUIApp.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/07.
//

import SwiftUI

@main
struct StarbucksClone_SwiftUIApp: App {
  @State var isSplashViewEnded = false

  var body: some Scene {
    WindowGroup {
      if isSplashViewEnded {
        MainTabView()
      } else {
        SplashView(isSplashViewEnded: $isSplashViewEnded)
      }
    }
  }
}
