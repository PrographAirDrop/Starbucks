//
//  MainView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct MainView: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let whatsNewSectionHeader = "What's New"
  }
  
  enum Metric {
    static let commonHorizontalPadding = 20.f
    static let sectionSpacing = 20.f
    static let bottomPadding = 100.f
    
    static let recommendMenuSpacing = 20.f
    
    static let markerImageSize = 16.f
    static let locationInfoSpacing = 4.f
    
    static let logoImageSize = 32.f
    
    static let orderPreparingViewSpacing = 8.f
  }
  
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: MainViewModel
  @State var selectedMenu: Beverage?
  @State var index = 0

  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        Color(R.color.backgroundBase)
          .ignoresSafeArea()
        
        ScrollView {
          MainBannerCarousel(banners: viewModel.mainBanner)

          RecommendMenuSectionHeader(name: viewModel.userName)
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: Metric.recommendMenuSpacing) {
              ForEach(viewModel.recommendMenu, id: \.id) { beverage in
                Button {
                  selectedMenu = beverage
                } label: {
                  RecommendMenuCell(beverage: beverage)
                    .fullScreenCover(item: $selectedMenu, content: { beverage in
                      let viewModel = MenuDetailViewModel(beverage: beverage)
                      MenuDetailView(viewModel: viewModel)
                    })
                }
              }
            }
            .padding(.horizontal, Metric.commonHorizontalPadding)
          }

          Spacer()
            .frame(height: Metric.sectionSpacing)

          LargeTitleSectionHeader(title: Constants.whatsNewSectionHeader)
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
              ForEach(viewModel.event, id: \.id) { event in
                EventCell(event: event)
              }
            }
            .padding(.horizontal, Metric.commonHorizontalPadding)
          }
          .padding(.bottom, Metric.bottomPadding)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Image(R.image.logo)
              .renderingMode(.original)
              .resizable()
              .scaledToFit()
              .frame(width: Metric.logoImageSize,
                     height: Metric.logoImageSize)
              .unredacted()
          }
          
          ToolbarItem(placement: .principal) {
            HStack(spacing: Metric.locationInfoSpacing) {
              Image(R.image.marker)
                .resizable()
                .scaledToFit()
                .frame(width: Metric.markerImageSize,
                       height: Metric.markerImageSize)
              Text(viewModel.locationName)
                .fontWeight(.semibold)
                .foregroundColor(Color(R.color.textBase))
            }
            .unredacted()
          }
        }
        
        VStack {
          Spacer()
          
          OrderPreparingView()
        }
        .padding(Metric.orderPreparingViewSpacing)
      }
    }
  }
}


// MARK: - Preview

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: MainViewModel())
  }
}
