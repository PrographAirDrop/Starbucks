//
//  DescriptionTextBox.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct DescriptionTextBox: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let contentSpacing = 0.f
    static let fontSize = 11.f
    static let padding = 16.f
    static let cornerRadius = 10.f
  }
  
  // MARK: - Properties
  
  var text: String
  
  
  // MARK: - Views
  
  var body: some View {
    VStack(spacing: Metric.contentSpacing) {
      Text(text)
        .multilineTextAlignment(.leading)
        .font(.system(size: Metric.fontSize))
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color(R.color.textBase))
        .padding(Metric.padding)
    }
    .background(Color(R.color.backgroundSecondary))
    .cornerRadius(Metric.cornerRadius)
  }
}


// MARK: - Preview

struct DescriptionTextBox_Previews: PreviewProvider {
  static var previews: some View {
    DescriptionTextBox(text: "Sample description")
      .previewLayout(.sizeThatFits)
  }
}
