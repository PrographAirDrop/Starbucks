//
//  LiteralType+FloatConvention.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/09.
//

import UIKit

extension IntegerLiteralType {
  var f: CGFloat {
    return CGFloat(self)
  }
}

extension FloatLiteralType {
  var f: CGFloat {
    return CGFloat(self)
  }
}
