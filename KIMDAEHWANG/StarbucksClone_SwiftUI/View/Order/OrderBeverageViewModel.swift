//
//  OrderBeverageViewModel.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/05/07.
//

import Foundation

final class OrderBeverageViewModel: ObservableObject {
  
  @Published var beverage: Beverage
  @Published var selectedTemperature: OrderBeverageView.Temperature = .cold
  @Published var selectedSize: OrderBeverageView.Size = .tall
  
  var alergyFactorText: String {
    guard beverage.allergyFactor.isEmpty == false else { return "없음" }
    return beverage.allergyFactor.reduce("") { result, factor in
      "\(result), \(factor.koreanName)"
    }
  }
  
  init(beverage: Beverage) {
    self.beverage = beverage
  }
}
