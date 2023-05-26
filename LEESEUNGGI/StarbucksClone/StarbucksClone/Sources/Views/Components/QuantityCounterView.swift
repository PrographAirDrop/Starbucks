//
//  QuantityCounterView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/09.
//

import SwiftUI

struct QuantityCounterView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let height = 28.f
    
    static let buttonSize = 28.f
    static let buttonPadding = 2.f
    static let buttonDisabledOpacity = 0.3.f
    static let buttonEnabledOpacity = 1.0.f
    
    static let quantityFontSize = 20.f
    static let quantityTextWidth = 40.f
  }
  
  
  // MARK: - Properties
  
  @Binding var quantity: Int
  var minQuantity: Int
  var maxQuantity: Int
  
  
  // MARK: - Views
  
  var body: some View {
    HStack {
      Button() {
        decreaseQuantity()
      } label: {
        Image(R.image.minusCircle)
          .resizable()
          .scaledToFit()
          .frame(width: Metric.buttonSize,
                 height: Metric.buttonSize)
          .padding(Metric.buttonPadding)
      }
      .disabled(quantity == minQuantity ? true : false)
      .opacity(quantity == minQuantity ? Metric.buttonDisabledOpacity : Metric.buttonEnabledOpacity)

      Text("\(quantity)")
        .font(.system(size: Metric.quantityFontSize, weight: .bold))
        .frame(width: Metric.quantityTextWidth)
      
      Button() {
        increaseQuantity()
      } label: {
        Image(R.image.addCircle)
          .resizable()
          .scaledToFit()
          .frame(width: Metric.buttonSize,
                 height: Metric.buttonSize)
          .padding(Metric.buttonPadding)
      }
      .disabled(quantity == maxQuantity ? true : false)
      .opacity(quantity == maxQuantity ? Metric.buttonDisabledOpacity : Metric.buttonEnabledOpacity)
    }
    .foregroundColor(Color(R.color.iconWhite))
    .frame(height: Metric.height)
  }
  
  
  // MARK: - Methods
  
  private func increaseQuantity() {
    quantity += 1
  }
  
  private func decreaseQuantity() {
    quantity -= 1
  }
}

struct QuantityCounterView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      QuantityCounterView(
        quantity: .constant(1),
        minQuantity: 1,
        maxQuantity: 99)
    }
  }
}
