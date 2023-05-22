//
//  HomeViewModel.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/05/16.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var bannerList: [Banner.MainBanner] = Banner.MainBanner.allCases
    @Published var recommendList: [Beverage] = Beverage.recommend
    @Published var eventList: [Event] = Event.whatsNew
    
}
