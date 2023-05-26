//
//  OrderPreparingView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/10.
//

import SwiftUI

struct OrderPreparingView: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let description = "스타벅스 프로그라피점 (매장 내 직접 수령)"
    static let title = "홍길동님의 주문을 2번째 메뉴로 준비 중입니다."
  }
  
  enum Metric {
    static let padding = 12.f
    static let cornerRadius = 10.f
    static let borderWidth = 1.f
    
    static let imageSize = 44.f
    
    static let descriptionFontSize = 12.f
    static let titleFontSize = 14.f
    static let textSpacing = 4.f
  }
  
  // MARK: - Properties
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.padding) {
      Image(R.image.strawberryAcaiWithLemonadeStarbucksRefreshers)
        .resizable()
        .scaledToFit()
        .frame(width: Metric.imageSize, height: Metric.imageSize)
        .clipShape(Circle())
      
      VStack(alignment: .leading, spacing: Metric.textSpacing) {
        Text(Constants.description)
          .multilineTextAlignment(.leading)
          .font(.system(size: Metric.descriptionFontSize, weight: .regular))
          .foregroundColor(Color(R.color.textSecondary))
          
        
        Text(Constants.title)
          .multilineTextAlignment(.leading)
          .font(.system(size: Metric.titleFontSize, weight: .bold))
          .foregroundColor(Color(R.color.textBase))
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(Metric.padding)
    .background(BlurView())
    .border(Color(R.color.lineTertiary), width: Metric.borderWidth)
    .cornerRadius(Metric.cornerRadius)
  }
}


// MARK: - Preview

struct OrderPreparingView_Previews: PreviewProvider {
  static var previews: some View {
    OrderPreparingView()
      .previewLayout(.sizeThatFits)
  }
}
