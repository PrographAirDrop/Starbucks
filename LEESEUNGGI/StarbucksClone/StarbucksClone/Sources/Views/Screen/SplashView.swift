//
//  SplashView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct SplashView: View {
  
  // MARK: - Constants
  
  enum Constant {
    static let animationName = "bean_loading"
    static let splashDuration = 2.f
  }
  
  enum Metric {
    static let logoWidth = 116.f
    static let logoHeight = 116.f
    static let logoBorderWidth = 4.f
    static let imageBottomInset = 120.f
    
    static let animationViewWidth = 88.f
    static let animationViewHeight = 88.f
  }
  
  
  // MARK: - Properties
  
  @State private var isLoading = true
  
  
  // MARK: - Views
  
  var body: some View {
    if isLoading == false {
      MainTabView()
    } else {
      ZStack {
        Color.accentColor
          .ignoresSafeArea()
        
        Image(R.image.logo)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(
            width: Metric.logoWidth,
            height: Metric.logoHeight)
          .overlay(
            Circle()
              .stroke(
                Color(R.color.accentGreen),
                lineWidth: Metric.logoBorderWidth)
          )
          .padding(.bottom, Metric.imageBottomInset)
        
        VStack {
          Spacer()
          
          LottieView(name: Constant.animationName)
            .frame(
              width: Metric.animationViewWidth,
              height: Metric.animationViewHeight)
            .padding()
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(
          deadline: .now() + Constant.splashDuration,
          execute: .init(block: {
            withAnimation(.easeIn(duration: 0.2)) {
              isLoading = false
            }
          }))
      }
    }
  }
}


// MARK: - Preview

struct LaunchScreen_Previews: PreviewProvider {
  static var previews: some View {
    SplashView()
  }
}
