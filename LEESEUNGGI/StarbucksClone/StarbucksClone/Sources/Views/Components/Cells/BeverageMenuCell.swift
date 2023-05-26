//
//  BeverageMenuCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct BeverageMenuCell: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let padding = 20.f
    
    static let imageSpacing = 16.f
    static let imageSize = 80.f
    
    static let titleFontSize = 15.f
    static let titleLineLimit = 2
    
    static let descriptionFontSize = 11.f
    static let descriptionLineLimit = 2
    static let descriptionSpacing = 4.f
    
    static let priceFontSize = 15.f
    static let priceSpacing = 12.f
  }
  
  
  // MARK: - Properties
  
  var beverage: Beverage
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.imageSpacing) {
      Image(uiImage: beverage.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .frame(width: Metric.imageSize,
               height: Metric.imageSize)
        .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: Metric.priceSpacing) {
        VStack(alignment: .leading, spacing: Metric.descriptionSpacing) {
          Text(beverage.koreanName)
            .lineLimit(Metric.titleLineLimit)
            .font(.system(size: Metric.titleFontSize, weight: .semibold))
            .foregroundColor(Color(R.color.textBase))
            .multilineTextAlignment(.leading)
          
          Text(beverage.name)
            .lineLimit(Metric.descriptionLineLimit)
            .font(.system(size: Metric.descriptionFontSize))
            .foregroundColor(Color(R.color.textSecondary))
            .multilineTextAlignment(.leading)
        }
        
        Text(beverage.price.priceExpression)
          .font(.system(size: Metric.priceFontSize, weight: .semibold))
          .foregroundColor(Color(R.color.textBase))
      }
      
      Spacer()
    }
    .padding(Metric.padding)
  }
}


// MARK: - Preview

struct BeverageMenuCell_Previews: PreviewProvider {
  static var previews: some View {
    BeverageMenuCell(beverage: Beverage.Category.refresher.beverages.first!)
  }
}
