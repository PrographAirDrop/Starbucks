//
//  OrderViewModel.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/05/07.
//

import Foundation

final class OrderViewModel: ObservableObject {
  @Published var categories: [Beverage.Category]
  
  init(categories: [Beverage.Category] = Beverage.Category.allCases) {
    self.categories = categories
  }
}
