//
//  SearchResultViewModel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

class SearchResultViewModel: ObservableObject {

  // MARK: - Properties
  
  private var term: String
  @Published var searchResult = [Beverage]()
  
  
  // MARK: - LifeCycle
  
  init(term: String) {
    self.term = term
    
    setup()
  }
  
  
  // MARK: - Setup
  
  private func setup() {
    setupData()
  }
  
  
  // MARK: - Setup Data
  
  private func setupData() {
    let beverages = Beverage.Category.allCases
      .flatMap { $0.beverages }
      .filter { $0.koreanName.contains(term) || $0.name.contains(term) }
    searchResult = beverages
  }
}
