//
//  BeverageCategoryCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct BeverageCategoryCell: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let horizontalPadding = 20.f
    static let verticalPadding = 12.f
    
    static let imageSpacing = 16.f
    static let imageSize = 64.f
    
    static let textSpacing = 4.f
    static let subTitleFontSize = 13.f
  }
  
  
  // MARK: - Properties
  
  var category: Beverage.Category
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.imageSpacing) {
      Image(uiImage: category.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .frame(width: Metric.imageSize,
               height: Metric.imageSize)
        .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: Metric.textSpacing) {
        Text(category.categoryTitle)
          .fontWeight(.semibold)
          .foregroundColor(Color(R.color.textBase))
          .multilineTextAlignment(.leading)
        Text(category.categorySubtitle)
          .font(.system(size: Metric.subTitleFontSize))
          .foregroundColor(Color(R.color.textSecondary))
          .multilineTextAlignment(.leading)
      }
      
      Spacer()
    }
    .padding(.horizontal, Metric.horizontalPadding)
    .padding(.vertical, Metric.verticalPadding)
    .background(Color(R.color.backgroundBase))
  }
}

// MARK: - Preview

struct BeverageCategoryCell_Previews: PreviewProvider {
  static var previews: some View {
    BeverageCategoryCell(category: .refresher)
  }
}
