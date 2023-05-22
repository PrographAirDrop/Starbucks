//
//  HomeView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/08.
//

import SwiftUI

struct HomeView: View {

  var body: some View {
    ScrollView {
      VStack {
        HomeTitleView(branchName: "프로그라피")

        HomeBannerView()

        RecommendationTitleView(customerName: "홍길동")
        RecommendationView()
        
        PromotionView()
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}



struct HomeTitleView: View {
  var branchName: String

  var body: some View {
    HStack {
      Image("LogoImage")
        .frame(width: 32, height: 32)
      Spacer()
      Image("marker")
        .resizable()
        .frame(width: 16, height: 16)
      Text("스타벅스 \(branchName)점")
        .padding(.trailing, 20)
      Spacer()
    }
    .frame(height: 50)
    .padding(.horizontal, 20)
  }
}

struct HomeBannerView: View {
  var banners = Banner.MainBanner.allCases
  @State var currentPage: Int = 0

  var body: some View {
    TabView {
      ForEach(banners, id: \.self) { banner in
        bannerImageView(of: banner)
      }
    }
    // TODO: TabView의 index를 가져와서 binding 한 뒤, ... 에 연결할 수 있을 듯!
    .tabViewStyle(PageTabViewStyle())
    .frame(width: UIScreen.screenWidth, height: 250)
  }

  @ViewBuilder
  func bannerImageView(of banner: Banner.MainBanner) -> some View {
    if let image = banner.item.thumbnailImage {
      Image(uiImage: image)
        .resizable()
        .cornerRadius(10)
        .aspectRatio(contentMode: .fit)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.screenWidth)
        .tabItem { Text("\(banner.id)") }
    }
  }
}

struct RecommendationTitleView: View {
  var customerName: String

  var body: some View {
    HStack(spacing: 0) {
      Text(customerName)
        .foregroundColor(.brown)
        .font(.title2)
        .fontWeight(.bold)
        .multilineTextAlignment(.leading)
      Text("님을 위한 추천 메뉴")
        .font(.title2)
        .fontWeight(.bold)
        .multilineTextAlignment(.leading)
      Spacer()
    }.padding(.leading, 20)
  }
}

struct RecommendationView: View {
  private var recommendBeverages = Beverage.recommend

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 16) {
        ForEach(recommendBeverages) { beverage in
          VStack {
            if let image = beverage.thumbnailImage {
              Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 110)
                .clipShape(Circle())
            }

            Text(beverage.koreanName)
              .lineLimit(2)
              .minimumScaleFactor(0.5)
              .multilineTextAlignment(.center)
              .fixedSize(horizontal: false, vertical: true)
          }.frame(width: 112)

        }
      }.padding(.leading, 20)
    }
  }
}

struct PromotionView: View {
  var whatsNewEvents = Event.WhatsNew.allCases.map { $0.items }

  var body: some View {

    HStack {
      Text("What's new")
        .font(.title2)
        .fontWeight(.medium)
      Spacer()
    }.padding(.leading, 20)

    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 16) {
        ForEach(whatsNewEvents) { event in
          VStack(spacing: 6) {
            if let image = event.thumbnailImage {
              Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 144, height: 144)
                .cornerRadius(10)
            }
            Text(event.eventPeriod)
              .font(.system(size: 9))
              .foregroundColor(.gray)
              .frame(width: 144, alignment: .leading)
            Text(event.title)
              .font(.system(size: 14))
              .multilineTextAlignment(.center)
              .frame(width: 144, alignment: .leading)
              .fixedSize(horizontal: false, vertical: true)

          }
        }
      }.padding(.leading, 16)

    }
  }
}
