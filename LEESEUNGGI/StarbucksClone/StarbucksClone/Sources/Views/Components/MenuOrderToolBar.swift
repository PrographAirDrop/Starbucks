//
//  MenuOrderToolBar.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct MenuOrderToolBar: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let minQuantity = 1
    static let maxQuantity = 99
    
    static let cartButtonTitle = "담기"
    static let orderButtonTitle = "주문하기"
  }
  
  enum Metric {
    static let horizontalPadding = 24.f
    static let verticalPadding = 16.f
    
    static let verticalSpacing = 12.f
    
    static let priceFontSize = 24.f
    
    static let buttonSpacing = 8.f
    static let buttonFontSize = 15.f
    static let buttonVerticalPadding = 8.f
    
    static let cartButtonWidth = 76.f
    static let orderButtonBorderWidth = 1.f
    
    static let orderButtonWidth = 120.f
  }
  
  
  // MARK: - Properties
  
  var menu: Beverage
  @State var quantity: Int = 1
  
  
  // MARK:  - Views
  
  var body: some View {
    VStack {
      Spacer()
      
      VStack(spacing: Metric.verticalSpacing) {
        HStack {
          QuantityCounterView(
            quantity: $quantity,
            minQuantity: Constants.minQuantity,
            maxQuantity: Constants.maxQuantity)
          
          Spacer()
          
          Text((quantity * menu.price).priceExpression)
            .font(.system(size: Metric.priceFontSize, weight: .bold))
            .foregroundColor(Color(R.color.textWhite))
        }
        .background(Color(R.color.accentGreen).ignoresSafeArea())
        
        HStack(spacing: Metric.buttonSpacing) {
          Spacer()
          
          Button() {
            
          } label: {
            Text(Constants.cartButtonTitle)
              .font(.system(size: Metric.buttonFontSize, weight: .medium))
              .padding(.vertical, Metric.buttonVerticalPadding)
              .frame(width: Metric.cartButtonWidth)
              .foregroundColor(Color(R.color.textWhite))
              .overlay(
                Capsule()
                  .stroke(Color(R.color.lineWhite),
                          lineWidth: Metric.orderButtonBorderWidth)
              )
          }
          
          Button() {
            
          } label: {
            Text(Constants.orderButtonTitle)
              .font(.system(size: Metric.buttonFontSize, weight: .medium))
              .padding(.vertical, Metric.buttonVerticalPadding)
              .frame(width: Metric.orderButtonWidth)
              .background(Color(R.color.backgroundBase))
              .clipShape(Capsule())
          }
        }
      }
      .padding(.horizontal, Metric.horizontalPadding)
      .padding(.vertical, Metric.verticalPadding)
      .background(Color(R.color.accentGreen).ignoresSafeArea())
    }
  }
}


// MARK: - Preview

struct MenuOrderToolBar_Previews: PreviewProvider {
  static var previews: some View {
    MenuOrderToolBar(menu: .recommend.first!)
  }
}
