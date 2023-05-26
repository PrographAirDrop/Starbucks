//
//  StretchableImageHeader.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/10.
//

import SwiftUI

struct StretchableImageHeader: View {
  
  // MARK: - Properties
  
  var image: Image
  
  
  // MARK: - Views
  
  var body: some View {
    GeometryReader { proxy in
      if proxy.frame(in: .global).minY <= 0 {
        image
          .resizable()
          .scaledToFill()
          .frame(width: proxy.size.width, height: proxy.size.width)
      } else {
        image
          .resizable()
          .scaledToFill()
          .offset(y: -proxy.frame(in: .global).minY)
          .frame(width: proxy.size.width,
                 height: proxy.size.width + proxy.frame(in: .global).minY)
      }
    }
    .frame(height: UIScreen.main.bounds.width)
  }
}


// MARK: - Preview

struct StretchableImageHeader_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      StretchableImageHeader(image: Image(R.image.strawberryAcaiWithLemonadeStarbucksRefreshers))
      Spacer()
    }
  }
}
