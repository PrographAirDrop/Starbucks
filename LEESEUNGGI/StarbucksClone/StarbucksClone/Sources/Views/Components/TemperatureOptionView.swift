//
//  TemperatureOptionView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct TemperatureOptionView: View {
  
  // MARK: - Properties
  
  @State var selectedIndex = 0
  @Binding var selectedOption: Beverage.TemperatureOption
  
  var temperatureOptionType: Beverage.TemperatureOptionType {
    didSet {
      switch temperatureOptionType {
      case .hotOnly:
        selectedOption = .hot
      case .icedOnly:
        selectedOption = .iced
      default:
        selectedOption = .iced
      }
    }
  }
  
  
  // MARK: - Views
  
  var body: some View {
    VStack {
      switch temperatureOptionType {
      case .hotOnly:
        CapsuleView(title: Beverage.TemperatureOptionType.hotOnly.rawValue, color: Color(R.color.accentRed))
      case .icedOnly:
        CapsuleView(title: Beverage.TemperatureOptionType.icedOnly.rawValue, color: Color(R.color.accentBlue))
      case .free:
        TemperatureOptionSegmentedControl(selectedTemperatureOption: $selectedOption)
      }
    }
    
  }
}


// MARK: - Preview

struct TemperatureOptionView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      VStack {
        TemperatureOptionView(
          selectedOption: .constant(.hot),
          temperatureOptionType: .free)
        
        TemperatureOptionView(
          selectedOption: .constant(.iced),
          temperatureOptionType: .free)
        
        TemperatureOptionView(
          selectedOption: .constant(.iced),
          temperatureOptionType: .icedOnly)
        
        TemperatureOptionView(
          selectedOption: .constant(.hot),
          temperatureOptionType: .hotOnly)
      }
    }
    .padding()
    .background(Color.black)
    .previewLayout(.sizeThatFits)
  }
}
