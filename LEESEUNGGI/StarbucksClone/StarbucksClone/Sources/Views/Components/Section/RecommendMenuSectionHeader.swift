//
//  SectionHeader.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct RecommendMenuSectionHeader: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let headerTitle = "님을 위한 추천메뉴"
  }
  
  enum Metric {
    static let padding = 20.f
    static let fontSize = 20.f
    static let textSpacing = 4.f
  }
  
  // MARK: - Properties
  
  var name: String
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.textSpacing) {
      Text(name)
        .foregroundColor(Color(R.color.accentBrown))
      Text(Constants.headerTitle)
        .foregroundColor(Color(R.color.textBase))
      
      Spacer()
    }
    .font(.system(size: Metric.fontSize, weight: .bold))
    .padding(Metric.padding)
    .background(Color(R.color.backgroundBase))
  }
}


// MARK: - Preview

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    RecommendMenuSectionHeader(name: "홍길동")
  }
}
