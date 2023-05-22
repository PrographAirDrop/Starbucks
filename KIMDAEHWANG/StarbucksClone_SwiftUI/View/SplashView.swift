//
//  SplashView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct SplashView: View {
  @Binding var isSplashViewEnded: Bool

  var body: some View {
    ZStack {
      Color.accentColor
        .ignoresSafeArea()

      Image("logo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 120, height: 120)
    }.onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        withAnimation {
          isSplashViewEnded = true
        }
      }
    }
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    SplashView(isSplashViewEnded: .init(get: { false }, set: { _ in }))
  }
}
