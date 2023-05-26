//
//  OrderCategoryDetailView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct OrderCategoryDetailView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let cellSpacing = 0.f
    static let bottomInset = 100.f
    
    static let toolbarButtonPadding = 8.f
    static let toolbarButtonSize = 36.f
  }
  
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: OrderCategoryDetailViewModel
  @Environment(\.presentationMode) var presentationMode
  @State private var isSearchViewPresented = false
  @State private var selectedMenu: Beverage?
  
  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          LazyVStack(spacing: Metric.cellSpacing) {
            ForEach(viewModel.category.beverages, id: \.id) { beverage in
              Button {
                selectedMenu = beverage
              } label: {
                BeverageMenuCell(beverage: beverage)
                  .listRowInsets(.init())
                  .fullScreenCover(item: $selectedMenu, content: { beverage in
                    let viewModel = MenuDetailViewModel(beverage: beverage)
                    MenuDetailView(viewModel: viewModel)
                  })
              }
            }
          }
          .padding(.bottom, Metric.bottomInset)
        }
        
        VStack {
          Spacer()
          BottomLocationSelectorView()
        }
      }
      .navigationTitle(viewModel.category.categoryTitle)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image(R.image.chevronLeft)
              .resizable()
              .scaledToFit()
              .padding(Metric.toolbarButtonPadding)
              .frame(width: Metric.toolbarButtonSize,
                     height: Metric.toolbarButtonSize)
              .foregroundColor(Color(R.color.iconBase))
          }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            isSearchViewPresented = true
          } label: {
            Image(R.image.magnifyingGlass)
              .resizable()
              .scaledToFit()
              .padding(Metric.toolbarButtonPadding)
              .frame(width: Metric.toolbarButtonSize,
                     height: Metric.toolbarButtonSize)
              .foregroundColor(Color(R.color.iconBase))
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .fullScreenCover(isPresented: $isSearchViewPresented, content: SearchView.init)
  }
}


// MARK: - Preview

struct OrderCategoryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = OrderCategoryDetailViewModel(category: .coldBrew)
    OrderCategoryDetailView(viewModel: viewModel)
  }
}
