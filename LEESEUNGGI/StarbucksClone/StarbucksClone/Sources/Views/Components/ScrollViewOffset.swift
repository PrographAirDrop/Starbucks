//
//  ScrollViewOffset.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/19.
//

import SwiftUI

struct ScrollViewOffset<Content: View>: View {
  
  // MARK: - Properties
  
  let content: () -> Content
  let onOffsetChange: (CGFloat) -> Void
  
  
  // MARK: - LifeCycle
  
  init(@ViewBuilder _ content: @escaping () -> Content,
       onOffsetChange: @escaping (CGFloat) -> Void) {
    self.content = content
    self.onOffsetChange = onOffsetChange
  }
  
  
  // MARK: - Views
  
  var body: some View {
    ScrollView {
      offsetReader
      content()
    }
    .coordinateSpace(name: "frameLayer")
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange)
  }
  
  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(
          key: OffsetPreferenceKey.self,
          value: proxy.frame(in: .named("frameLayer")).minY)
    }
    .frame(height: 0)
  }
}

struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) { }
}
