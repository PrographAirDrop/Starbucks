//
//  OrderCategoryViewModel.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/05/07.
//

import Foundation

final class OrderCategoryViewModel: ObservableObject {
  @Published var beverages: [Beverage]
  
  init(beverages: [Beverage]) {
    self.beverages = beverages
  }
}
