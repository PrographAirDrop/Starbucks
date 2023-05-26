//
//  SearchTextField.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct SearchTextField: View {
  
  // MARK: - Constants
  
  enum Constant {
    static let placeholder = "검색"
  }
  
  enum Metric {
    static let horizontalSpacing = 12.f
    static let contentSpacing = 12.f
    static let minHeight = 40.f
    static let cornerRadius = 10.f
    
    static let magnifyingGlassSize = 16.f
  }
  
  
  // MARK: - Properties
  
  @State var searchTerm = ""
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.contentSpacing) {
      Image(R.image.magnifyingGlass)
        .resizable()
        .scaledToFit()
        .frame(
          width: Metric.magnifyingGlassSize,
          height: Metric.magnifyingGlassSize)
        .foregroundColor(Color(R.color.iconSecondary))
        
      TextField(Constant.placeholder, text: $searchTerm)
        .keyboardType(.webSearch)
    }
    .padding(.leading, Metric.horizontalSpacing)
    .frame(maxWidth: .infinity, minHeight: Metric.minHeight)
    .background(Color(R.color.backgroundSecondary))
    .cornerRadius(Metric.cornerRadius)
  }
}


// MARK: - Preview

struct SearchTextField_Previews: PreviewProvider {
  static var previews: some View {
    SearchTextField()
      .previewLayout(.sizeThatFits)
  }
}
