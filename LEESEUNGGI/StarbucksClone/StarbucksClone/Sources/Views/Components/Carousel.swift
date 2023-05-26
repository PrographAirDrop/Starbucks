//
//  Carousel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/28.
//

import SwiftUI

struct Carousel<Content: View, T: Hashable>: View {
  
  // MARK: - Properties
  
  var content: (T) -> Content
  var items: [T]
  var spacing: CGFloat
  var edgeSpace: CGFloat
  @Binding var index: Int
  
  @State var offsetX: CGFloat = .zero
  @State var previousOffsetX: CGFloat = .zero
  
  
  // MARK: - Initializers
  
  init(spacing: CGFloat = 10,
       edgeSpace: CGFloat = 10,
       index: Binding<Int>,
       items: [T],
       @ViewBuilder content: @escaping (T) -> Content) {
    self.spacing = spacing
    self.edgeSpace = edgeSpace
    self._index = index
    self.items = items
    self.content = content
  }
  
  
  // MARK: - Views
  
  var body: some View {
    GeometryReader { proxy in
      let itemWidth = proxy.size.width - (spacing + edgeSpace) * 2
      
      HStack(spacing: spacing) {
        ForEach(items, id: \.self) { item in
          content(item)
            .frame(width: itemWidth)
        }
      }
      .padding(.horizontal, edgeSpace * 2)
      .offset(x: offsetX)
      .gesture(
        DragGesture()
          .onChanged { gesture in
            offsetX = previousOffsetX + gesture.translation.width
          }
          .onEnded { gesture in
            let widthVelocity = gesture.predictedEndLocation.x - gesture.location.x
            let threshold = gesture.translation.width / itemWidth
            
            if threshold > 0.5 || widthVelocity > 150 {
              // 왼으로 넘어감
              withAnimation(.spring().speed(1.2)) {
                let nextIndex = index - 1
                if nextIndex >= 0 {
                  offsetX = -((itemWidth + edgeSpace) * CGFloat(nextIndex))
                  index = nextIndex
                }
                else {
                  offsetX = previousOffsetX
                }
              }
            }
            else if threshold < -0.5 || widthVelocity < -150 {
              // 오른쪽로 넘어감
              withAnimation(.spring().speed(1.2)) {
                let nextIndex = index + 1
                if nextIndex < items.count {
                  offsetX = -((itemWidth + edgeSpace) * CGFloat(nextIndex))
                  index = nextIndex
                }
                else {
                  offsetX = previousOffsetX
                }
              }
            }
            else {
              withAnimation(.spring().speed(1.2)) {
                offsetX = previousOffsetX
              }
            }
            
            previousOffsetX = offsetX
          }
      )
    }
  }
}

struct Carousel_Previews: PreviewProvider {
  
  static var previews: some View {
    let banners = Banner.MainBanner.allCases
    @State var index = 0
    
    Carousel(index: $index,
             items: banners) { banner in
      Image(uiImage: banner.item.thumbnailImage!)
        .resizable()
        .scaledToFit()
        .cornerRadius(20)
    }
  }
}
