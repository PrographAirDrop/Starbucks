//
//  SearchView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/14.
//

import SwiftUI

struct SearchView: View {
  
  // MARK: - Constants
  
  
  // MARK: - Properties
  
  @Environment(\.presentationMode) var presentationMode
  
  
  // MARK: - View
  
  var body: some View {
    VStack {
      VStack(spacing: 0) {
        HStack {
          SearchTextField()
          
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Text("취소")
              .font(.system(size: 15, weight: .medium))
              .foregroundColor(Color(R.color.accentBlack))
          }
          .padding(.horizontal, 12)
        }
        .padding(.leading, 20)
        .padding(.trailing, 12)
        .frame(maxWidth: .infinity, minHeight: 60)
        .background(Color(R.color.backgroundBase))
        
        Divider()
      }
      
      SearchHistoryView()
    }
  }
}


// MARK: - Preview

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    SearchView()
  }
}
