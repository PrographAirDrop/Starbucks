//
//  PagingBannerView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/21.
//

import SwiftUI

//struct PagingBannerView<Content: View>: View {
//
//  // MARK: - Properties
//  
//  @Binding var index: Int
//  let content: () -> Content
//
//
//  // MARK: - Initializers
//
//  init(index: Int,
//       @ViewBuilder content: @escaping () -> Content) {
//    self.index = index
//    self.content = content
//  }
//
//  var body: some View {
//    TabView(selection: $index) {
//      content()
//    }
//    .tabViewStyle(.page(indexDisplayMode: .never))
//  }
//}
//
//struct PagingBannerView_Previews: PreviewProvider {
//  static var previews: some View {
//    PagingBannerView(index: 0) {
//      ForEach(Banner.MainBanner.allCases, id: \.self) { banner in
//        Image(uiImage: banner.item.thumbnailImage!)
//      }
//    }
//  }
//}
