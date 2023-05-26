//
//  SizeOptionItem.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct SizeOptionItem: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let minWidth = 88.f
    static let maxWidth = 112.f
    
    static let imageSize = 62.f
    static let tallImagePadding = 17.f
    static let grandeImagePadding = 14.f
    static let ventiImagePadding = 11.f
    
    static let bottomPadding = 12.f
    static let horizontalPadding = 4.f
    
    static let sizeTitleFontSize = 15.f
    static let capacityFontSize = 13.f
    
    static let contentSpacing = 0.f
    
    static let cornerRadius = 10.f
    static let borderWidth = 1.5.f
  }
  
  
  // MARK: - Properties
  
  var sizeOption: Beverage.SizeOption
  @State var isHighlighted: Bool
  
  var imagePadding: CGFloat {
    switch sizeOption {
    case .tall:
      return Metric.tallImagePadding
    case .grande:
      return Metric.grandeImagePadding
    case .venti:
      return Metric.ventiImagePadding
    }
  }
  
  
  // MARK: - Views
  
  var body: some View {
    VStack(alignment: .center, spacing: Metric.contentSpacing) {
      Image(R.image.tumbler)
        .resizable()
        .scaledToFit()
        .padding(imagePadding)
        .frame(width: Metric.imageSize, height: Metric.imageSize)
        .foregroundColor(isHighlighted ?  Color(R.color.accentGreen) : Color(R.color.iconSecondary))
      
      VStack(spacing: Metric.contentSpacing) {
        Text(sizeOption.title)
          .font(.system(size: Metric.sizeTitleFontSize, weight: .medium))
          .foregroundColor(isHighlighted ?  Color(R.color.textBase) : Color(R.color.textSecondary))
        
        Text("\(sizeOption.capacity)ml")
          .font(.system(size: Metric.capacityFontSize))
          .foregroundColor(Color(R.color.textSecondary))
      }
      .padding(.bottom, Metric.bottomPadding)
      .padding(.horizontal, Metric.horizontalPadding)
    }
    .frame(minWidth: Metric.minWidth,
           maxWidth: Metric.maxWidth)
    .overlay(
      RoundedRectangle(cornerRadius: Metric.cornerRadius)
        .stroke(isHighlighted ? Color(R.color.accentGreen) : Color(R.color.lineSecondary),
                lineWidth: Metric.borderWidth)
    )
    .background(Color(R.color.backgroundBase))
  }
}


// MARK: - Preview

struct SizeOptionCell_Previews: PreviewProvider {
  static var previews: some View {
    SizeOptionItem(sizeOption: .tall, isHighlighted: true)
  }
}
