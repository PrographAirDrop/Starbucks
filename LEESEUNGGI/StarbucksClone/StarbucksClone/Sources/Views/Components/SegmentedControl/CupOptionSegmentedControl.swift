//
//  CupOptionSegmentedControl.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/13.
//

import SwiftUI

struct CupOptionSegmentedControl: View {
  
  // MARK: - Properties
  
  @Binding var selectedOption: Beverage.CupOption
  
  
  // MARK: - Views
  
  var body: some View {
    SegmentedControl(
      selectedIndex: Binding<Int>.init(
        get: {
        return selectedOption.rawValue
      }, set: { index in
        selectedOption = Beverage.CupOption(rawValue: index)!
      }),
      options: Beverage.CupOption.allCases.map { $0.title })
  }
}


// MARK: - Preview

struct CupOptionSegmentedControl_Previews: PreviewProvider {
  static var previews: some View {
    CupOptionSegmentedControl(selectedOption: .constant(.reusable))
  }
}
