//
//  LottieView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI
import UIKit

import Lottie

struct LottieView: UIViewRepresentable {
  
  // MARK: - Properties
  
  var name: String
  let animationView = LottieAnimationView()
  
  
  // MARK: - Methods
  
  func makeUIView(context: Context) -> some UIView {
    let view = UIView(frame: .zero)
    
    animationView.animation = .named(name)
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = .loop
    animationView.play()
    
    view.addSubview(animationView)
    animationView.translatesAutoresizingMaskIntoConstraints = false
    animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    
    return view
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
}


// MARK: - Preview

struct LottieView_Previews: PreviewProvider {
  static var previews: some View {
    LottieView(name: "bean_loading")
      .frame(width: 100, height: 100)
  }
}
