//
//  MenuOptionSectionView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct MenuOptionSectionView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let lineLimit = 2
    static let fontSize = 15.f
    static let verticalPadding = 12.f
  }
  
  
  // MARK: - Properties
  
  var title: String
  
  
  // MARK: - Views
  
  var body: some View {
    Text(title)
      .multilineTextAlignment(.leading)
      .lineLimit(Metric.lineLimit)
      .font(.system(size: Metric.fontSize, weight: .bold))
      .foregroundColor(Color(R.color.textBase))
      .padding(.vertical, Metric.verticalPadding)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}


// MARK: - Preview

struct MenuOptionSectionView_Previews: PreviewProvider {
  static var previews: some View {
    MenuOptionSectionView(title: "Sample title")
  }
}
