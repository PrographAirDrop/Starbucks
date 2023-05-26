//
//  SizeOptionSelectorView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct SizeOptionSelectorView: View {
  
  // MARK: - Properties
  
  @Binding var selectedSizeOption: Beverage.SizeOption
  
  
  // MARK: - Views
  
  var body: some View {
    HStack(spacing: 8) {
      ForEach(Beverage.SizeOption.allCases, id: \.self) { size in
        ZStack {
          if selectedSizeOption == size {
            SizeOptionItem(sizeOption: size, isHighlighted: true)
          } else {
            SizeOptionItem(sizeOption: size, isHighlighted: false)
          }
        }
        .onTapGesture {
          withAnimation(.easeInOut(duration: 0.2)) {
            selectedSizeOption = size
          }
        }
      }
    }
  }
}


// MARK: - Preview

struct SizeSelectorView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SizeOptionSelectorView(selectedSizeOption: .constant(.tall))
    }
  }
}
