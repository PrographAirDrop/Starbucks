//
//  BlurView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/10.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
  
  // MARK: - Properties
  
  var style: UIBlurEffect.Style = .systemMaterial
  
  
  // MARK: - Methods
  
  func makeUIView(context: Context) -> some UIView {
    return UIVisualEffectView(effect: UIBlurEffect(style: style))
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) { }
}
