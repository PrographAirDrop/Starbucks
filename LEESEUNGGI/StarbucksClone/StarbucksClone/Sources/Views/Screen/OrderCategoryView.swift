//
//  OrderCategoryView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct OrderCategoryView: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let navigationTitle = "주문하기"
  }
  
  enum Metric {
    static let cellSpacing = 0.f
    
    static let bottomInset = 100.f
    
    static let toolbarButtonPadding = 8.f
    static let toolbarButtonSize = 36.f
  }
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: OrderCategoryViewModel
  @State private var isSearchResultPresented = false
  
  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView() {
          LazyVStack(spacing: Metric.cellSpacing) {
            ForEach(viewModel.categories, id: \.self) { category in
              let viewModel = OrderCategoryDetailViewModel(category: category)
              NavigationLink(destination: OrderCategoryDetailView(viewModel: viewModel)) {
                BeverageCategoryCell(category: category)
                  .listRowInsets(.init())
              }
            }
          }
          .padding(.bottom, Metric.bottomInset)
        }
        .navigationTitle(Constants.navigationTitle)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              isSearchResultPresented = true
            } label: {
              Image(R.image.magnifyingGlass)
                .resizable()
                .scaledToFit()
                .padding(Metric.toolbarButtonPadding)
                .frame(width: Metric.toolbarButtonSize,
                       height: Metric.toolbarButtonSize)
                .foregroundColor(Color(R.color.textBase))
            }
          }
        }
        
        VStack {
          Spacer()
          BottomLocationSelectorView()
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .fullScreenCover(isPresented: $isSearchResultPresented, content: SearchView.init)
  }
}


// MARK: - Preview

struct OrderCategoryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderCategoryView(viewModel: OrderCategoryViewModel())
  }
}
