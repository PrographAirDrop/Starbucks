//
//  Int+PriceExpression.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/08.
//

import UIKit

extension Int {
  var priceExpression: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let formattedNumber = numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    
    return "\(formattedNumber) 원"
  }
}
