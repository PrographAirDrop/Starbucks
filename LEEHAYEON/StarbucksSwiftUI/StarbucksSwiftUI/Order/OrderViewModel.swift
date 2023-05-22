//
//  OrderViewModel.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/05/17.
//

import Foundation
import Combine

class OrderViewModel: ObservableObject {
    
    @Published var beverageList: [Beverage.Category] = Beverage.Category.allCases
    
}
