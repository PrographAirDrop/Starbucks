//
//  MainViewModel.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/13.
//

import SwiftUI

class MainViewModel: ObservableObject {
  
  // MARK: - Properties
  
  @Published var userName = ""
  @Published var locationName = ""
  @Published var mainBanner: [Banner.MainBanner] = []
  @Published var mainBannerIndex = 0
  @Published var recommendMenu: [Beverage] = []
  @Published var event: [Event] = []
  
  
  // MARK: - LifeCycle
  
  init() {
    setup()
  }
  
  
  // MARK: - Setups
  
  private func setup() {
    setupData()
  }
  
  
  // MARK: - Setup Data
  
  private func setupData() {
    self.userName = "이승기"
    self.locationName = "스타벅스 프로그라피점"
    self.mainBanner = Banner.MainBanner.allCases
    self.recommendMenu = Beverage.recommend
    self.event = Event.whatsNew
  }
}
