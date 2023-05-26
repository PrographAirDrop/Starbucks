//
//  SearchHistoryView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct SearchHistoryView: View {
  
  // MARK: - Constants
  
  enum Constant {
    static let sectionHeader = "최근 검색어"
    static let clear = "전체삭제"
  }
  
  enum Metric {
    static let topPadding = 20.f
    
    static let sectionLeadingPadding = 20.f
    static let sectionTrailingPadding = 12.f
    
    static let sectionHeaderFontSize = 20.f
    
    static let clearButtonPadding = 12.f
    static let clearButtonFontSize = 15.f
    
    static let searchHistoryItemSpacing = 0.f
  }
  
  // MARK: - Properties
  
  var searchHistories = ["유자", "캐모마일", "아메리카노"]
  
  
  // MARK: - Views
  
  var body: some View {
    VStack {
      HStack {
        Text(Constant.sectionHeader)
          .font(.system(size: Metric.sectionHeaderFontSize, weight: .bold))
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Button {
          
        } label: {
          Text(Constant.clear)
            .font(.system(size: Metric.clearButtonFontSize, weight: .medium))
            .foregroundColor(Color(R.color.accentGreen))
            .padding(.horizontal, Metric.clearButtonPadding)
        }
      }
      .padding(.leading, Metric.sectionLeadingPadding)
      .padding(.trailing, Metric.sectionTrailingPadding)
      
      ScrollView {
        LazyVStack(spacing: Metric.searchHistoryItemSpacing) {
          ForEach(searchHistories, id: \.self) { term in
            SearchHistoryCell(term: term)
          }
        }
      }
    }
    .padding(.top, Metric.topPadding)
    .background(Color(R.color.backgroundBase))
  }
}


// MARK: - Preview

struct SearchHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    SearchHistoryView()
  }
}
