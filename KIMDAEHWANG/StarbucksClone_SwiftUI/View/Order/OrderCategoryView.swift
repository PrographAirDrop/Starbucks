//
//  OrderCategoryView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/09.
//

import SwiftUI

struct OrderCategoryView: View {
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: OrderCategoryViewModel
  
  // MARK: - View
  
  var body: some View {
    VStack {
      List(viewModel.beverages) { beverage in
        NavigationLink {
          let viewModel = OrderBeverageViewModel(beverage: beverage)
          OrderBeverageView(viewModel: viewModel)
        } label: {
          OrderCategoryCellView(beverage: beverage)
        }
        .listRowSeparator(.hidden)
        .padding(.vertical, 5)
      }
      .listStyle(.plain)
    }
    .navigationBarBackButtonHidden(true)
  }
}

struct OrderCategoryCellView: View {
  var beverage: Beverage
  
  var body: some View {
    HStack(spacing: 15) {
      if let image = beverage.thumbnailImage {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 90, height: 90)
          .clipShape(Circle())
      }
      
      VStack(alignment: .leading, spacing: 5) {
        Text(beverage.koreanName)
          .fontWeight(.semibold)
        Text(beverage.name)
          .foregroundColor(.secondary)
          .font(.caption)
          .minimumScaleFactor(0.7)
          .lineLimit(1)
        Text("\(beverage.price)")
          .padding(.top, 10)
      }
    }
  }
}


struct OrderCategoryView_Previews: PreviewProvider {
  static var previews: some View {
//    OrderCategoryView(beverages: Beverage.Category.allCases.first!.beverages)
    OrderCategoryView(
      viewModel: OrderCategoryViewModel(
        beverages:  Beverage.Category.allCases.first!.beverages
      )
    )
  }
}
