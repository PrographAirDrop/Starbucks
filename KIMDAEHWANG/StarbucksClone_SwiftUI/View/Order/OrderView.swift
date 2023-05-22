//
//  OrderView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct OrderView: View {
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: OrderViewModel
  
  // MARK: - View
  
  var body: some View {
    
    VStack {
      SearchTabbarView()
      
      NavigationView {
        List(viewModel.categories) { category in
          
          NavigationLink {
            let viewModel = OrderCategoryViewModel(beverages: category.beverages)
            OrderCategoryView(viewModel: viewModel)
              .navigationTitle(category.categoryTitle)
          } label: {
            OrderCellView(category: category)
          }
          .listRowSeparator(.hidden)
          .padding(.vertical, 5)
          
        }
        .listStyle(.plain)
        .navigationTitle("주문하기")
        
      }
    }
  }
}

struct OrderCellView: View {
  var category: Beverage.Category
  
  var body: some View {
    HStack(spacing: 15) {
      if let image = category.thumbnailImage {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 80, height: 80)
          .clipShape(Circle())
      }
      
      VStack(alignment: .leading, spacing: 5) {
        Text(category.categoryTitle)
          .fontWeight(.semibold)
        Text(category.categorySubtitle)
          .foregroundColor(.secondary)
          .font(.caption)
      }
    }
  }
}

struct OrderView_Previews: PreviewProvider {
  static var previews: some View {
    OrderView(viewModel: OrderViewModel())
  }
}

struct SearchTabbarView: View {
  var body: some View {
    HStack {
      Spacer()
      Button(action: {
        
      }) {
        Image(systemName: "magnifyingglass")
          .resizable()
          .foregroundColor(.black)
          .frame(width: 20, height: 20)
      }
      .frame(alignment: .trailing)
      .padding(.horizontal, 24)
    }
  }
}
