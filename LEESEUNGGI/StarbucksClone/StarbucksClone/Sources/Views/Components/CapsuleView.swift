//
//  CapsuleView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct CapsuleView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let fontSize = 15.f
    static let minHeight = 44.f
    static let lineWidth = 1.5.f
  }
  
  
  // MARK: - Properties
  
  var title: String
  var color: Color
  

  // MARK: - Views
  
  var body: some View {
    Text(title)
      .font(.system(size: Metric.fontSize, weight: .semibold))
      .frame(maxWidth: .infinity, minHeight: Metric.minHeight)
      .foregroundColor(color)
      .background(Color.clear)
      .overlay(
        Capsule()
          .stroke(color, lineWidth: Metric.lineWidth)
      )
  }
}

// MARK: - Preview

struct CapsuleView_Previews: PreviewProvider {
  static var previews: some View {
    CapsuleView(title: "ICED ONLY", color: Color(R.color.accentBlue))
      .padding()
      .background(Color.black)
      .previewLayout(.sizeThatFits)
  }
}
