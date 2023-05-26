//
//  MainBannerCarousel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/21.
//

import SwiftUI

struct MainBannerCarousel: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let spacing = 16.f
    static let padding = 20.f
    
    static let itemWidth = 335.f
    static let itemHeight = 252.f
    static let cornerRadius = 20.f
  }
  
  
  // MARK: - Properties
  
  var banners: [Banner.MainBanner]
  
  
  // MARK: - Views
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: Metric.spacing) {
        ForEach(banners, id: \.id) { banner in
          GeometryReader { proxy in
            Image(uiImage: banner.item.thumbnailImage!)
              .resizable()
              .scaledToFit()
              .cornerRadius(Metric.cornerRadius)
              .rotation3DEffect(
                Angle(degrees: Double((proxy.frame(in: .global).minX - 20) / -40)),
                axis: (x: 10, y: 10.0, z: 0))
          }
          .frame(width: Metric.itemWidth,
                 height: Metric.itemHeight)
        }
      }
      .padding(Metric.padding)
    }
  }
}


// MARK: - Preview

struct RotationBannerView_Previews: PreviewProvider {
  static var previews: some View {
    MainBannerCarousel(banners: Banner.MainBanner.allCases)
  }
}
