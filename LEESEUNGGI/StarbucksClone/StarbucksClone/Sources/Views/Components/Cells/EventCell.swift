//
//  EventCell.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/06.
//

import SwiftUI

struct EventCell: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let width = 144.f
    
    static let imageCornerRadius = 10.f
    
    static let imageSpacing = 12.f
    static let textSpacing = 4.f
    
    static let eventPeriodFontSize = 15.f
    static let titleFontSize = 11.f
  }
  
  
  // MARK: - Properties
  
  var event: Event
  
  var body: some View {
    Link(destination: URL(string: event.url)!) {
      VStack(alignment: .leading, spacing: Metric.imageSpacing) {
        Image(uiImage: event.thumbnailImage!)
          .resizable()
          .scaledToFit()
          .cornerRadius(Metric.imageCornerRadius)
        
        VStack(alignment: .leading, spacing: Metric.textSpacing) {
          Text(event.eventPeriod)
            .multilineTextAlignment(.leading)
            .font(.system(size: Metric.titleFontSize))
            .foregroundColor(Color(R.color.textSecondary))
          
          Text(event.title)
            .multilineTextAlignment(.leading)
            .font(.system(size: Metric.eventPeriodFontSize, weight: .medium))
            .foregroundColor(Color(R.color.textBase))
        }
        
        Spacer()
      }
    }
    .frame(width: Metric.width)
  }
}


// MARK: - Preview

struct EventCell_Previews: PreviewProvider {
  static var previews: some View {
    EventCell(event: Event.whatsNew.first!)
  }
}
