//
//  RecommendMenuCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct RecommendMenuCell: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let width = 112.f
    static let imageSize = 112.f
    
    static let lineLimit = 2
    static let fontSize = 15.f
  }
  
  // MARK: - Properties
  
  var beverage: Beverage
  
  
  // MARK: - Views
  
  var body: some View {
    VStack {
      Image(uiImage: beverage.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .frame(width: Metric.imageSize,
               height: Metric.imageSize)
        .clipShape(Circle())
      
      Text(beverage.koreanName)
        .multilineTextAlignment(.center)
        .lineLimit(Metric.lineLimit)
        .font(.system(size: Metric.fontSize, weight: .medium))
        .foregroundColor(Color(R.color.textBase))
      
      Spacer()
    }
    .frame(width: Metric.width)
  }
}


// MARK: - Preview

struct RecommendMenuCell_Previews: PreviewProvider {
  static var previews: some View {
    RecommendMenuCell(beverage: Beverage.recommend.first!)
  }
}
