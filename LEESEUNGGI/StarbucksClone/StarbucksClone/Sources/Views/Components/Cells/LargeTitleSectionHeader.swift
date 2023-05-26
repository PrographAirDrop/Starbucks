//
//  LargeTitleSectionHeader.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct LargeTitleSectionHeader: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let fontSize = 20.f
    static let padding = 20.f
  }
  
  
  // MARK: - Properties
  
  var title: String
  
  
  // MARK: - Views
  
  var body: some View {
    HStack {
      Text(title)
        .font(.system(size: Metric.fontSize, weight: .bold))
        .foregroundColor(Color(R.color.textBase))
      
      Spacer()
    }
    .padding(Metric.padding)
    .background(Color(R.color.backgroundBase))
  }
}


// MARK: - Preview

struct LargeTitleSectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    LargeTitleSectionHeader(title: "Title")
  }
}
