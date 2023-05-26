//
//  OrderCategoryViewModel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/13.
//

import SwiftUI

class OrderCategoryViewModel: ObservableObject {
  
  // MARK: - Properties
  
  @Published var categories: [Beverage.Category] = []
  
  
  // MARK: - LifeCycle
  
  init() {
    setup()
  }
  
  
  // MARK: - Setups
  
  private func setup() {
    setupData()
  }
  
  
  // MARK: - Setup Data
  
  private func setupData() {
    categories = Beverage.Category.allCases
  }
}
