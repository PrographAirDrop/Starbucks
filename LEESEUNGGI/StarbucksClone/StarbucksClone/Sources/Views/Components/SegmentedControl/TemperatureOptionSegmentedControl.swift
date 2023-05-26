//
//  TemperatureOptionSegmentedControl.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct TemperatureOptionSegmentedControl: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let height = 44.f
    static let cornerRadius = 22.f
    static let padding = 4.f
    
    static let itemSpacing = 0.f
    static let itemPadding = 4.f
    static let itemFontSize = 15.f
  }
  
  // MARK: - Properties
  
  @Binding var selectedTemperatureOption: Beverage.TemperatureOption
  
  
  // MARK: - Views
  
  var body: some View {
    ZStack {
      GeometryReader { proxy in
        let width = proxy.size.width / 2
        let index = selectedTemperatureOption == .hot ? 0 : 1
        
        Capsule()
          .fill(Color(R.color.backgroundBase))
          .padding(Metric.padding)
          .frame(width: width)
          .offset(x: width * CGFloat(index))
      }
      
      HStack(spacing: Metric.itemSpacing) {
        ForEach(Beverage.TemperatureOption.allCases, id: \.self) { option in
          Button {
            withAnimation(.spring().speed(2)) {
              selectedTemperatureOption = option
            }
          } label: {
            switch option {
              case .iced:
                Text(option.rawValue)
                  .font(.system(size: Metric.itemFontSize, weight: .medium))
                  .foregroundColor(selectedTemperatureOption == option ? Color(R.color.accentBlue) : Color(R.color.textSecondary))
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
              case .hot:
                Text(option.rawValue)
                  .font(.system(size: Metric.itemFontSize, weight: .medium))
                  .foregroundColor(selectedTemperatureOption == option ? Color(R.color.accentRed) : Color(R.color.textSecondary))
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
              }
          }
        }
      }
    }
    .frame(height: Metric.height)
    .background(Color(R.color.backgroundSecondary))
    .clipShape(Capsule())
  }
}


// MARK: - Preview

struct TemperatureOptionSegmentedControl_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()

      VStack {
        TemperatureOptionSegmentedControl(selectedTemperatureOption: .constant(.hot))
        TemperatureOptionSegmentedControl(selectedTemperatureOption: .constant(.iced))
      }
    }
  }
}
