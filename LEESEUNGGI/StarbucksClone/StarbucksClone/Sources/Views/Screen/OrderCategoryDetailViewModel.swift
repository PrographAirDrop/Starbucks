//
//  OrderCategoryDetailViewModel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/13.
//

import SwiftUI

class OrderCategoryDetailViewModel: ObservableObject {
  
  // MARK: - Properties
  
  @Published var category: Beverage.Category
  
  
  // MARK: - LifeCycle
  
  init(category: Beverage.Category) {
    self.category = category
  }
}
