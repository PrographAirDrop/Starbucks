//
//  SearchHistoryCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct SearchHistoryCell: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let horizontalPadding = 20.f
    static let contentSpacing = 12.f
    static let minHeight = 44.f
    
    static let termFontSize = 15.f
   
    static let deleteButtonSize = 28.f
    static let deleteButtonPadding = 8.f
  }
  
  
  // MARK: - Properties
  
  var term: String
  

  // MARK: - Views
  
  var body: some View {
    HStack(spacing: Metric.contentSpacing) {
      Text(term)
        .font(.system(size: Metric.termFontSize, weight: .medium))
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Button {
        // delete history action here
      } label: {
        Image(R.image.xmark)
          .resizable()
          .scaledToFit()
          .foregroundColor(Color(R.color.iconSecondary))
      }
      .padding(Metric.deleteButtonPadding)
      .frame(width: Metric.deleteButtonSize,
             height: Metric.deleteButtonSize)
    }
    .padding(.horizontal, Metric.horizontalPadding)
    .frame(maxWidth: .infinity, minHeight: Metric.minHeight)
    .background(Color(R.color.backgroundBase))
  }
}


// MARK: - Preview

struct SearchHistoryCell_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      
      SearchHistoryCell(term: "검색어")
    }
  }
}
