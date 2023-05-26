//
//  BottomLocationSelectorView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct BottomLocationSelectorView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let horizontalPadding = 20.f
    
    static let contentSpacing = 20.f
    
    static let locationSelectButtonFontSize = 12.f
    static let chevronImageSize = 16.f
    static let locationSelectButtonHeight = 36.f
    static let locationSelectButtonPadding = 12.f
    static let locationSelectButtonCornerRadius = 10.f
    
    static let cartImageButtonSize = 36.f
    static let cartImagePadding = 6.f
  }
  
  // MARK: - Views
  
  var body: some View {
    HStack {
      Button {
        
      } label: {
        HStack(spacing: Metric.contentSpacing) {
          Text("주문할 매장을 선택해 주세요.")
            .font(.system(size: Metric.locationSelectButtonFontSize))
            .fontWeight(.semibold)
          
          Spacer()
          
          Image(R.image.arrowRight)
            .resizable()
            .scaledToFit()
            .frame(width: Metric.chevronImageSize,
                   height: Metric.chevronImageSize)
        }
        .frame(height: Metric.locationSelectButtonHeight)
        .padding(.horizontal, Metric.locationSelectButtonPadding)
        .foregroundColor(Color(R.color.textWhite))
      }
      .background(Color(R.color.accentBlackSecondary))
      .cornerRadius(Metric.locationSelectButtonCornerRadius)
      
      Button {
        
      } label: {
        Image(R.image.bascket)
          .resizable()
          .scaledToFit()
          .padding(Metric.cartImagePadding)
          .frame(width: Metric.cartImageButtonSize,
                 height: Metric.cartImageButtonSize)
      }
    }
    .padding(.horizontal, Metric.horizontalPadding)
    .frame(height: 60)
    .background(Color(R.color.accentBlack))
  }
}


// MARK: - Preview

struct BottomLocationSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    BottomLocationSelectorView()
      .previewLayout(.sizeThatFits)
  }
}
