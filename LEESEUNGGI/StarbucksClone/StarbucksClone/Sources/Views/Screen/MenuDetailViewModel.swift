//
//  MenuDetailViewModel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/13.
//

import SwiftUI

class MenuDetailViewModel: ObservableObject {
  
  // MARK: - Properties
  
  @Published var beverage: Beverage
  @Published var selectedSize: Beverage.SizeOption = .tall
  @Published var temperatureOption: Beverage.TemperatureOption = .iced
  @Published var cupOption: Beverage.CupOption = .reusable
  
  
  // MARK: - LifeCycle
  
  init(beverage: Beverage) {
    self.beverage = beverage
    setup()
  }
  
  // MARK: - Setup
  
  private func setup() {
    setupData()
  }
  
  
  // MARK: - Setup Data
  
  private func setupData() {
    switch beverage.temperatureOptionType {
    case .hotOnly:
      temperatureOption = .hot
    case .icedOnly:
      temperatureOption = .iced
    default:
      break
    }
  }
}
