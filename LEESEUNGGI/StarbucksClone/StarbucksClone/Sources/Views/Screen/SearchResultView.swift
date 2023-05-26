//
//  SearchResultView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct SearchResultView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let itemSpacing = 0.f
  }
  
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: SearchResultViewModel
  
  
  // MARK: - Views
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: Metric.itemSpacing) {
        ForEach(viewModel.searchResult, id: \.id) { beverage in
          BeverageMenuCell(beverage: beverage)
        }
      }
    }
    .background(Color(R.color.backgroundBase))
  }
}


// MARK: - Preview

struct SearchResultView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = SearchResultViewModel(term: "제주")
    SearchResultView(viewModel: viewModel)
  }
}
