//
//  Beverage.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/05.
//

import UIKit

struct Beverage: Identifiable {
  
  enum Category: CaseIterable, Identifiable {
    var id: UUID { return UUID() }
    case refresher, coldBrew, blonde, espresso, decafCoffee, frappuccino, blended, physio, teavana, others
  }
  
  let id: UUID = UUID()
  let name: String
  let koreanName: String
  let temperatureOptionType: TemperatureOptionType
  let thumbnailImage: UIImage?
  let price: Int
  let description: String?
  let descriptionCaution: String?
  let allergyFactor: [AllergyFactor]
}


// MARK: - Size Option

extension Beverage {
  
  enum SizeOption: Int, CaseIterable {
    case tall
    case grande
    case venti
    
    var title: String {
      switch self {
      case .tall:
        return "Tall"
      case .grande:
        return "Grande"
      case .venti:
        return "Venti"
      }
    }
    
    var capacity: Int {
      switch self {
      case .tall:
        return 355
      case .grande:
        return 473
      case .venti:
        return 591
      }
    }
  }
}


// MARK: - Allergy Factor

extension Beverage {
  
  enum AllergyFactor {
    case milk, soybean, wheat, peanut, squid, egg
  }
  
  var allergyFactorDescription: String {
    return allergyFactor.map { $0.koreanName }.joined(separator: ", ")
  }
}


// MARK: - Temperature Option

extension Beverage {
  
  enum TemperatureOptionType: String {
    case hotOnly = "HOT ONLY"
    case icedOnly = "ICDED ONLY"
    case free = "FREE"
  }
  
  enum TemperatureOption: String, CaseIterable {
    case hot = "HOT"
    case iced = "ICED"
  }
}


// MARK: - Cup Option

extension Beverage {
  
  enum CupOption: Int, CaseIterable {
    case personal
    case reusable
    case disposable
    
    var title: String {
      switch self {
      case .personal:
        return "개인컵"
      case .reusable:
        return "매장컵"
      case .disposable:
        return "일회용컵"
      }
    }
  }
}


// MARK: - Recommended

extension Beverage {
  
  static var recommend: [Beverage] {
    return [
      .init(name: "Cold Brew with Oat",
            koreanName: "콜드 브루 오트 라떼",
            temperatureOptionType: .icedOnly,
            thumbnailImage: UIImage(named: "Cold Brew with Oat"),
            price: 5800,
            description: "콜드 브루의 풍미와 깔끔한 오트음료(식물성 대체유)가 어우러 진 달콤 고소한 라떼.",
            descriptionCaution: "식물성 대체유를 사용해 모든 고객이 부담없이 즐길 수 있는 콜드 브루 음료",
            allergyFactor: []),
      .init(name: "Iced DECAF Caffe Latte",
            koreanName: "아이스 디카페인 카페 라떼",
            temperatureOptionType: .free,
            thumbnailImage: UIImage(named: "Iced DECAF Caffe Latte"),
            price: 5300,
            description: "깊고 진한 에스프레소 샷과 우유가 어우러진 부드러운 아이스 디카페인 카페 라떼를 즐겨보세요!",
            descriptionCaution: "이미지는 연출된 사진이므로 실제와 다를 수 있습니다. 디카페인 선택 300원이 추가된 금액입니다.",
            allergyFactor: [.milk]),
      .init(name: "Jeju Forest Cold Brew",
            koreanName: "제주 비자림 콜드 브루",
            temperatureOptionType: .icedOnly,
            thumbnailImage: UIImage(named: "Jeju Forest Cold Brew"),
            price: 6800,
            description: "제주 천년의 숲 비자림을 연상시키는 음료로 제주 유기농 말차와. 콜드 브루가 조화로운 제주 특화 콜드 브루 음료",
            descriptionCaution: "제주 지역 및 일부 매장에서만 판매합니다. (더양평DTR, 더북한강R, 더북한산, 이대R, 별다방, 대구종로고택, 경동1960)",
            allergyFactor: []),
      .init(name: "Espresso",
            koreanName: "에스프레소",
            temperatureOptionType: .free,
            thumbnailImage: UIImage(named: "Espresso"),
            price: 4000,
            description: "스타벅스 에스프레소는 향기로운 크레마 층과 바디 층, 하트 층 으로 이루어져 있으며, 입안 가득히 커피와 달콤한 카라멜 향이 느껴지는 커피 음료",
            descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요.",
            allergyFactor: []),
      .init(name: "Java Chip Vanilla Affogato",
            koreanName: "자바 칩 바닐라 아포가토",
            temperatureOptionType: .icedOnly,
            thumbnailImage: UIImage(named: "Java Chip Vanilla Affogato"),
            price: 6600,
            description: "유기농 바닐라 아이스크림에 스타벅스의 에스프레소를 붓고 달콤한 자바칩을 토핑한 아포가토입니다.",
            descriptionCaution: "• ﻿﻿에스프레소 샷은 블론드/디카페인으로 변경하여 즐기실 수 있습니다.\n• ﻿﻿디저트 컨셉으로 한정된 커스텀만 제공됩니다.",
            allergyFactor: []),
    ]
  }
}


extension Beverage.AllergyFactor {
  
  var koreanName: String {
    switch self {
    case .milk:
      return "우유"
    case .soybean:
      return "대두"
    case .wheat:
      return "밀"
    case .peanut:
      return "땅콩"
    case .squid:
      return "오징어"
    case .egg:
      return "알류"
    }
  }
}


extension Beverage.Category {
  
  var thumbnailImage: UIImage? {
    switch self {
    case .refresher:
      return UIImage(named: "Strawberry Acai with Lemonade Starbucks Refreshers")
    case .coldBrew:
      return UIImage(named: "Cold Brew with Oat")
    case .blonde:
      return UIImage(named: "Iced Brown Sugar Oat Shaken Espresso")
    case .espresso:
      return UIImage(named: "Iced Choux Cream Latte")
    case .decafCoffee:
      return UIImage(named: "Iced DECAF Caramel Macchiato")
    case .frappuccino:
      return UIImage(named: "Double Espresso Chip Frappuccino")
    case .blended:
      return UIImage(named: "Basil Lemon Sherbet Blended")
    case .physio:
      return UIImage(named: "Yuja Passion Starbucks Fizzio")
    case .teavana:
      return UIImage(named: "Pink Flower Youthberry Tea")
    case .others:
      return UIImage(named: "Spring Strawberry Milk")
    }
  }
  
  var categoryTitle: String {
    switch self {
    case .refresher:
      return "리프레셔"
    case .coldBrew:
      return "콜드브루"
    case .blonde:
      return "블론드"
    case .espresso:
      return "에스프레소"
    case .decafCoffee:
      return "디카페인 커피"
    case .frappuccino:
      return "프라푸치노"
    case .blended:
      return "블렌디드"
    case .physio:
      return "피지오"
    case .teavana:
      return "티바나"
    case .others:
      return "아포가토/기타"
    }
  }
  
  var categorySubtitle: String {
    switch self {
    case .refresher:
      return "Starbucks Refreshers"
    case .coldBrew:
      return "Cold Brew"
    case .blonde:
      return "Blonde Coffee"
    case .espresso:
      return "Espresso"
    case .decafCoffee:
      return "Decaf coffee"
    case .frappuccino:
      return "Frappuccino"
    case .blended:
      return "Blended"
    case .physio:
      return "Starbucks Fizzio"
    case .teavana:
      return "Teabana"
    case .others:
      return "Others"
    }
  }
  
  
  var beverages: [Beverage] {
    switch self {
    case .refresher:
      return [
        .init(name: "Strawberry Acai with Lemonade Starbucks Refreshers",
              koreanName: "딸기 아사이 레모네이드 스타벅스 리프레셔",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Strawberry Acai with Lemonade Starbucks Refreshers"),
              price: 5900,
              description: "딸기, 아사이베리 주스와 레모네이드가 달콤 상큼하게 조화된 맛 에 가볍게 에너지 부스팅을 할 수 있는 리프레셔 음료",
              descriptionCaution: "토핑으로 들어간 딸기의 양은 조금씩 달라질 수 있습니다. 클래식 시럽을 추가하여 더욱 달콤하게 즐길 수 있습니다.",
              allergyFactor: []),
        .init(name: "Pink Drink with Strawberry Acai Starbucks Refreshers",
              koreanName: "핑크 드링크 위드 딸기 아사이 스타벅스 리프레셔",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Pink Drink with Strawberry Acai Starbucks Refreshers"),
              price: 5900,
              description: "딸기, 아사이베리 주스와 코코넛 베이스가 달콤하고 부드럽게 조 화된 맛에 가볍게 에너지 부스팅을 할 수 있는 리프레셔 음료",
              descriptionCaution: "토핑으로 들어간 딸기의 양은 조금씩 달라질 수 있습니다. 클래식 시럽을 추가하여 더욱 달콤하게 즐길 수 있습니다.",
              allergyFactor: []),
      ]
    case .coldBrew:
      return [
        .init(name: "Cold Brew with Oat",
              koreanName: "콜드 부루 오트 라떼",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Cold Brew with Oat"),
              price: 5800,
              description: "콜드 브루의 풍미와 깔끔한 오트음료(식물성 대체유)가 어우러 진 달콤 고소한 라떼.",
              descriptionCaution: "식물성 대체유를 사용해 모든 고객이 부담없이 즐길 수 있는 콜드 브루 음료",
              allergyFactor: []),
        .init(name: "Dolce Cold Brew",
              koreanName: "돌체 콜드 브루",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Dolce Cold Brew"),
              price: 6000,
              description: "무더운 여름철, 동남아 휴가지에서 즐기는 커피를 떠오르게 하는 스타벅스 음료의 베스트 x 베스트 조합인 돌체 콜드 브루를 만나보세요!",
              descriptionCaution: "콜드 브루 판매 매장에서만 주문 가능한 음료입니다.",
              allergyFactor: []),
        .init(name: "Vanilla Cream Cold Brew",
              koreanName: "바닐라 크림 콜드 브루",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Vanilla Cream Cold Brew"),
              price: 5800,
              description: "콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브 루를 새롭게 즐길 수 있는 음료입니다.",
              descriptionCaution: "",
              allergyFactor: [.milk]),
        .init(name: "Cold Brew",
              koreanName: "콜드 브루",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Cold Brew"),
              price: 4900,
              description: "스타벅스 바리스타의 정성으로 탄생한 콜드 브루! 콜드 브루 전용 원두를 차가운 물로 추출하여 한정된 양만 제공 됩니다, 깊은 풍미의 새로운 커피 경험을 즐겨보세요.",
              descriptionCaution: "일부 매장에서는 판매하지 않으며, 매장 상황에 따라 소진 시점이 다를 수 있습니다.",
              allergyFactor: []),
        .init(name: "Nitro Vanilla Cream",
              koreanName: "나이트로 바닐라 크림",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Nitro Vanilla Cream"),
              price: 6100,
              description: "픽업대로 오시면 음료를 제조해드립니다. 매장 찾기에서 나이트로 콜드 브루 판매매장을 확인해보세요. 디카페인 에스프레소 샷 선택이 불가한 음료입니다.",
              descriptionCaution: "",
              allergyFactor: []),
        .init(name: "Nitro Cold Brew",
              koreanName: "나이트로 콜드 브루",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Nitro Cold Brew"),
              price: 6000,
              description: "나이트로 커피 정통의 캐스케이딩과 부드러운 콜드 크레마! 부드러운 목 넘김과 완벽한 밸런스에 커피 본연의 단맛을 경험할 수 있습니다.",
              descriptionCaution: "픽업대로 오시면 음료를 제조해드립니다. 매장 찾기에서 나이트로 콜드 브루 판매매장을 확인해보세요. 디카페인 에스프레소 샷 선택이 불가한 음료입니다.",
              allergyFactor: []),
        .init(name: "Jeju Forest Cold Brew",
              koreanName: "제주 비자림 콜드 브루",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Jeju Forest Cold Brew"),
              price: 6800,
              description: "제주 천년의 숲 비자림을 연상시키는 음료로 제주 유기농 말차와 콜드 브루가 조화로운 제주 특화 콜드 브루 음료",
              descriptionCaution: "제주 지역 및 일부 매장에서만 판매합니다. (더양평DTR, 더북한강R, 더북한산, 이대R, 별다방, 대구종로고택, 경동 1960)",
              allergyFactor: []),
        .init(name: "Signature The Black Cold Brew",
              koreanName: "시그니처 더 블랙 콜드 브루",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Signature The Black Cold Brew"),
              price: 19600,
              description: "콜드 브루 전용 원두를 차가운 물로 매장에서 직접 추출하여 부드럽고 진한 풍미의 콜드브루를 언제 어디서나 편하게 즐겨보세요 (전용 보틀 /500ml)",
              descriptionCaution: "• ﻿﻿주문 즉시 메뉴 제조를 시작하므로 주문 완료 후에는 변경 또는 취소할 수 없습니다.\n• ﻿﻿해당 제품은 콜드 브루 원액으로 물 또는 우유와 함께 즐겨주세요\n• ﻿﻿변심 또는 제조 공정상 발생 가능한 잔기스 등은 반품/교환\n• 대상에 해당되지 않습니다. (해당 보틀은 밀폐용기가 아닙니다)\n• ﻿﻿보틀 불량의 경우, 구매일로 부터 3일 이내에 매장 파트너^^ 확인 후 교환 처리 가능합니다.",
              allergyFactor: []),
        .init(name: "Jeju Citrus Honey Cold Brew",
              koreanName: "제주 시트러스 허니 콜드 브루",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Jeju Citrus Honey Cold Brew"),
              price: 7200,
              description: "제주에서 특별하게 즐기는 커피 & 티 베리에이션 스타일의 콜드브루 음료 제주 유채꿀, 민트 티, 콜드 브루의 이색적인 조화",
              descriptionCaution: "제주 지역만 판매",
              allergyFactor: []),
      ]
    case .blonde:
      return [
        .init(name: "Iced Brown Sugar Oat Shaken Espresso",
              koreanName: "브라운 슈가 오트 쉐이큰 에스프레소",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Iced Brown Sugar Oat Shaken Espresso"),
              price: 5900,
              description: "브라운 슈가의 달콤함과 블론드 샷의 부드러움이 쉐이킹을 통해 극대화 된 음료 시나몬과 브라운 슈가, 오트의 조화가 좋은 음료",
              descriptionCaution: "",
              allergyFactor: []),
        .init(name: "Iced Blonde Vanilla Double Shot Macchiato",
              koreanName: "아이스 블론드 바닐라 더블샷 마키아또",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Blonde Vanilla Double Shot Macchiato"),
              price: 5900,
              description: "블론드 에스프레소 2샷에 흑당 시럽과 바닐라 크림이 부드럽고 달콤하게 어우러진 마키아또 타입의 음료를 즐겨 보세요!",
              descriptionCaution: "블론드 에스프레소 음료는 일부 매장에서만 주문 가능합니다.",
              allergyFactor: [.milk]),
        .init(name: "Iced Blonde Starbucks Dolce Latte",
              koreanName: "아이스 블론드 스타벅스 돌체 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Blonde Starbucks Dolce Latte"),
              price: 5900,
              description: "밝고 경쾌한 블론드 에스프레소와 무지방 우유, 돌체 시럽이 달 콤하게 어우러진 아이스 블론드 스타벅스 돌체 라떼를 즐겨보세 요!",
              descriptionCaution: "블론드 에스프레소 음료는 일부 매장에서만 주문 가능합니다.",
              allergyFactor: [.milk]),
        .init(name: "Iced Blonde Caffe Latte",
              koreanName: "아이스 블론드 카페 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Blonde Caffe Latte"),
              price: 5000,
              description: "밝고 경쾌한 블론드 에스프레소와 우유가 부드럽게 어우러진 아이스 블론드 카페 라떼를 즐겨보세요!",
              descriptionCaution: "이미지는 연출된 사진이므로 실제와 다를 수 있습니다. 블론드 에스프레소 음료는 일부 매장에서만 주문 가능합니다.",
              allergyFactor: [.milk]),
        .init(name: "Iced Blonde Caffe Americano",
              koreanName: "아이스 블론드 카페 아메리카노",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Blonde Caffe Americano"),
              price: 4500,
              description: "블론드 에스프레소의 밝고 경쾌한 풍미를 아이스 블론드 카페 아메리카노로 즐겨보세요!",
              descriptionCaution: "블론드 에스프레소 음료는 일부 매장에서만 주문 가능합니다.",
              allergyFactor: []),
        .init(name: "Iced The Green Mugwort Cream Latte",
              koreanName: "아이스 더 그린 쑥 크림 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced The Green Mugwort Cream Latte"),
              price: 7000,
              description: "은은한 쑥과 곡물에 블론드 샷이 어우러져 고소하고 부드러운 라떼 달콤한 쑥 폼이 올라가 부드럽게 즐기는 아인슈페너 음료 *더북한산, 더양평DTR,더북한강R,경동1960,대구종로고택 매 장에서만 판매하는 음료입니다.",
              descriptionCaution: "더북한산, 더양평DTR, 더북한강R, 경동 1960,대구종로고택 매장에서만 판매하는 음료입니다.",
              allergyFactor: [.soybean, .milk]),
      ]
    case .espresso:
      return [
        .init(name: "Iced Choux Cream Latte",
              koreanName: "아이스 슈크림 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Choux Cream Latte"),
              price: 6300,
              description: "Choux is Coming! 봄을 알리는 스타벅스의 시그니처 음료 슈크림 라떼! 달콤한 슈크림과 에스프레소의 완벽한 조화",
              descriptionCaution: "음료 및 휘핑의 검은 점은 바닐라 빈이니 안심하고 드셔도 됩니다",
              allergyFactor: []),
        .init(name: "Vanilla Flat White",
              koreanName: "바닐라 플랫 화이트",
              temperatureOptionType: .hotOnly,
              thumbnailImage: UIImage(named: "Vanilla Flat White"),
              price: 5900,
              description: "바닐라 플랫 화이트는 진하고 고소한 리스트레토 샷과 바닐라 시럽 그리고 스팀 밀크로 즐기는 진한 커피 라떼 입니다.",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요. 최상의 맛을 위해 따뜻한 음료로 숏과 톨 사이즈로만 제공됩니다.",
              allergyFactor: []),
        .init(name: "Iced Starbucks Dolce Latte",
              koreanName: "아이스 스타벅스 돌체 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Starbucks Dolce Latte"),
              price: 5900,
              description: "스타벅스의 다른 커피 음료보다 더욱 깊은 커피의 맛과 향에 깔 끔한 무지방 우유와 부드러운 돌체 시럽이 들어간 음료로 달콤하고 진한 커피 라떼",
              descriptionCaution: "블론드/디카페인 커피 Tab에서 블론드, 디카페인, 1/2디카페인 스타벅스 돌체 라떼를 주문할 수 있습니다.",
              allergyFactor: []),
        .init(name: "Iced Caffe Mocha",
              koreanName: "아이스 카페 모카",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Caffe Mocha"),
              price: 5500,
              description: "진한 초콜릿 모카 시럽과 풍부한 에스프레소를 신선한 우유 그리 고 얼음과 섞어 휘핑크림으로 마무리한 음료로 진한 에스프레소 와 초콜릿 맛이 어우러진 커피",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요.",
              allergyFactor: []),
        .init(name: "Iced Caffe Americano",
              koreanName: "아이스 카페 아메리카노",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Caffe Americano"),
              price: 4500,
              description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
              descriptionCaution: "블론드/디카페인 커피 Tab에서 블론드, 디카페인, 1/2디카페인 아메리카노를 주문할 수 있습니다.",
              allergyFactor: []),
        .init(name: "Iced Caffe Latte",
              koreanName: "아이스 카페 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Caffe Latte"),
              price: 5000,
              description: "풍부하고 진한 농도의 에스프레소가 시원한 우유와 얼음을 만나 고소함과 시원함을 즐길 수 있는 대표적인 커피 라떼",
              descriptionCaution: "이미지는 연출된 사진이므로 실제와 다를 수 있습니다. 블론드/디카페인 커피 Tab에서 블론드, 디카페인, 1/2디카페인 카페 라떼를 주문할 수 있습니다.",
              allergyFactor: []),
        .init(name: "Iced Cappuccino",
              koreanName: "아이스 카푸치노",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Cappuccino"),
              price: 5000,
              description: "풍부하고 진한 에스프레소에 신선한 우유와 우유 거품이 얼음과 함께 들어간 시원하고 부드러운 커피 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요.",
              allergyFactor: []),
        .init(name: "Iced Caramel Macchiato",
              koreanName: "아이스 카라멜 마키아또",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Caramel Macchiato"),
              price: 5900,
              description: "향긋한 바닐라 시럽과 시원한 우유와 얼음을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤 한 커피 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 블론드로 즐겨보세요. 디카페인은 디카페인 커피Tab에서 선택 가능합니다.",
              allergyFactor: []),
        .init(name: "Iced White Chocolate Mocha",
              koreanName: "아이스 화이트 초콜릿 모카",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced White Chocolate Mocha"),
              price: 5900,
              description: "달콤하고 부드러운 화이트 초콜릿 시럽과 에스프레소를 신선한 우유 그리고 얼음과 섞어 휘핑크림으로 마무리한 음료로 달콤함과 강렬한 에스프레소가 부드럽게 어우러진 커피",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요.",
              allergyFactor: []),
        .init(name: "CoffeeStarbucks Double Shot",
              koreanName: "커피 스타벅스 더블 샷",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "CoffeeStarbucks Double Shot"),
              price: 5100,
              description: "신선하게 제조된 더블 샷 믹스에 클래식 시럽을 넣고 에스프레소 샷, 얼음이 어우러져 핸드 쉐이킹한 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요. 차갑게 제공되는 음료입니다. (시럽적게 선택시 음료양이 적을 수 있습니다)",
              allergyFactor: []),
        .init(name: "Vanilla Starbucks Double Shot",
              koreanName: "바닐라 스타벅스 더블 샷",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Vanilla Starbucks Double Shot"),
              price: 5100,
              description: "신선하게 제조된 더블 샷 믹스에 바닐라 시럽을 넣고 에스프레소 샷, 얼음이 어우러져 핸드 쉐이킹한 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요. 차갑게 제공되는 음료입니다. (시럽적게 선택시 음료양이 적을 수 있습니다)",
              allergyFactor: []),
        .init(name: "Hazelnut Starbucks Double Shot",
              koreanName: "헤이즐넛 스타벅스 더블 샷",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Hazelnut Starbucks Double Shot"),
              price: 6100,
              description: "신선하게 제조된 더블 샷 믹스에 헤이즐넛 시럽을 넣고 에스프레 소샷, 얼음이 어우러져 핸드 쉐이킹한 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요. 차갑게 제공되는 음료입니다. (시럽적게 선택시 음료양이 적을 수 있습니다)",
              allergyFactor: []),
        .init(name: "Espresso",
              koreanName: "에스프레소",
              temperatureOptionType: .hotOnly,
              thumbnailImage: UIImage(named: "Espresso"),
              price: 4000,
              description: "스타벅스 에스프레소는 향기로운 크레마 층과 바디 층, 하트 층 으로 이루어져 있으며, 입안 가득히 커피와 달콤한 카라멜 향이 느껴지는 커피 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요.",
              allergyFactor: []),
        .init(name: "Espresso Macchiato",
              koreanName: "에스프레소 마키아또",
              temperatureOptionType: .hotOnly,
              thumbnailImage: UIImage(named: "Espresso Macchiato"),
              price: 4000,
              description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로써, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요. 우유 거품 '없이'를 원할 경우, 에스프레소를 주문해주세요.",
              allergyFactor: []),
        .init(name: "Espresso Con Panna",
              koreanName: "에스프레소 콘 파나",
              temperatureOptionType: .hotOnly,
              thumbnailImage: UIImage(named: "Espresso Con Panna"),
              price: 4200,
              description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인이나 블론드로 즐겨보세요. 휘핑 크림 '없이'를 원할 경우, 에스프레소를 주문해주세요.",
              allergyFactor: []),
      ]
    case .decafCoffee:
      return [
        .init(name: "Iced DECAF Caramel Macchiato",
              koreanName: "아이스 디카페인 카라멜 마키아또",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced DECAF Caramel Macchiato"),
              price: 6200,
              description: "바닐라 시럽과 우유, 그리고 진한 에스프레소 샷과 달콤한 카라 멜 드리즐이 어우러진 아이스 디카페인 카라멜 마키아또를 즐겨 보세요!",
              descriptionCaution: "디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: [.soybean, .milk]),
        .init(name: "Iced DECAF Caffe Latte",
              koreanName: "아이스 디카페인 카페 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced DECAF Caffe Latte"),
              price: 5300,
              description: "깊고 진한 에스프레소 샷과 우유가 어우러진 부드러운 아이스 디카페인 카페 라떼를 즐겨보세요!",
              descriptionCaution: "이미지는 연출된 사진이므로 실제와 다를 수 있습니다. 디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: [.milk]),
        .init(name: "Iced DECAF Caffe Americano",
              koreanName: "아이스 디카페인 카페 아메리카노",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced DECAF Caffe Americano"),
              price: 4800,
              description: "스타벅스의 깊고 강렬한 에스프레소의 풍미를 아이스 디카페인 카페 아메리카노로 즐겨보세요!",
              descriptionCaution: "디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: []),
        .init(name: "Iced Half DECAF Starbucks Dolce Latte",
              koreanName: "아이스 1/2디카페인 스타벅스 돌체 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Half DECAF Starbucks Dolce Latte"),
              price: 6200,
              description: "깊고 진한 에스프레소 샷과 깔끔한 무지방 우유, 달콤한 돌체 시 럽이 부드럽게 어우러진 아이스 1/2디카페인 스타벅스 돌체 라 떼를 즐겨보세요!",
              descriptionCaution: "디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: [.milk]),
        .init(name: "Iced Half DECAF Caramel Macchiato",
              koreanName: "아이스 1/2디카페인 카라멜 마키아또",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Half DECAF Caramel Macchiato"),
              price: 6200,
              description: "필요할 때, 필요한 만큼 카페인을 조절하여 스타벅스 아이스 1/2디카페인 카라멜 마키아또를 즐겨보세요!",
              descriptionCaution: "디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: [.soybean, .milk]),
        .init(name: "Iced Half DECAF Caffe Latte",
              koreanName: "아이스 1/2디카페인 카페 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Half DECAF Caffe Latte"),
              price: 5300,
              description: "필요할 때, 필요한 만큼 카페인을 조절한 아이스 1/2디카페인 카페 라떼를 즐겨보세요.",
              descriptionCaution: "디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: [.milk]),
        .init(name: "Iced Half DECAF Caffe Americano",
              koreanName: "아이스 1/2디카페인 카페 아메리카노",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Half DECAF Caffe Americano"),
              price: 4800,
              description: "필요할 때, 필요한 만큼 카페인을 조절하여 스타벅스 아이스 1/2디카페인 카페 아메리카노를 즐겨보세요.",
              descriptionCaution: "디카페인 선택 300원이 추가된 금액입니다.",
              allergyFactor: []),
        
      ]
    case .frappuccino:
      return [
        .init(name: "Double Espresso Chip Frappuccino",
              koreanName: "더블 에스프레소 칩 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Double Espresso Chip Frappuccino"),
              price: 6300,
              description: "리스트레토 에스프레소 2샷과 에스프레소 칩, 하프앤하프가 진 하게 어우러진 커피의 기본에 충실한 프라푸치노",
              descriptionCaution: "퍼스널 옵션을 선택하여 디카페인으로 즐겨보세요.",
              allergyFactor: [.milk]),
        .init(name: "Malcha Cream Frappuccino from Jeju Organic Farm",
              koreanName: "제주 유기농 말차로 만든 크림 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Malcha Cream Frappuccino from Jeju Organic Farm"),
              price: 6300,
              description: "깊고 진한 말차 본연의 맛과 향을 시원하고 부드럽게 즐길 수 있 는 프라푸치노",
              descriptionCaution: "",
              allergyFactor: [.milk]),
        .init(name: "Java Chip Frappuccino",
              koreanName: "자바 칩 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Java Chip Frappuccino"),
              price: 6300,
              description: "커피, 모카 소스, 진한 초콜릿 칩이 입안 가득 느껴지는 스타벅스 에서만 맛볼 수 있는 프라푸치노",
              descriptionCaution: "",
              allergyFactor: [.soybean, .wheat, .milk]),
        .init(name: "Chocolate Cream Chip Frappuccino",
              koreanName: "초콜릿 크림 칩 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Chocolate Cream Chip Frappuccino"),
              price: 6000,
              description: "모카 소스와 진한 초콜릿 칩, 초콜릿 드리즐이 올라간 달콤한 크 림 프라푸치노",
              descriptionCaution: "",
              allergyFactor: [.soybean, .wheat, .milk]),
        .init(name: "White Chocolate Mocha Frappuccino",
              koreanName: "화이트 초콜릿 모카 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "White Chocolate Mocha Frappuccino"),
              price: 6000,
              description: "화이트 초콜릿, 커피와 우유가 조화로운 프라푸치노",
              descriptionCaution: "",
              allergyFactor: [.milk]),
        .init(name: "Caramel Frappuccino",
              koreanName: "카라멜 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Caramel Frappuccino"),
              price: 5900,
              description: "카라멜과 커피가 어우러진 프라푸치노",
              descriptionCaution: "",
              allergyFactor: [.soybean, .milk]),
        .init(name: "Vanilla Cream Frappuccino",
              koreanName: "바닐라 크림 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Vanilla Cream Frappuccino"),
              price: 5100,
              description: "신선한 우유와 바닐라 시럽이 어우러진 크림 프라푸치노",
              descriptionCaution: "",
              allergyFactor: [.milk]),
        .init(name: "Jeiu Black Sesame Cream Frappuccino",
              koreanName: "제주 까망 크림 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Jeiu Black Sesame Cream Frappuccino"),
              price: 7500,
              description: "[제주지역 한정음료] 제주 까망 라떼의 프라푸치노 버전으로 쫄깃한 국내산 흑임자 떡과 블랙 소보로 토핑으로 컵빙수처럼 먹는 음료.",
              descriptionCaution: "제주지역만 판매",
              allergyFactor: [.soybean, .peanut, .wheat, .egg, .squid, .milk]),
        .init(name: "Jeju Mugwort Cream Frappuccino",
              koreanName: "제주 쑥떡 크림 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Jeju Mugwort Cream Frappuccino"),
              price: 7500,
              description: "[제주지역 한정음료] 제주 쑥쑥 라떼의 시원한 버전으로 쫄깃쫄깃한 국내산 흑임자 떡으로 씹는 재미를 즐길 수 있는 음료.",
              descriptionCaution: "제주지역만 판매",
              allergyFactor: [.soybean, .wheat, .milk]),
        .init(name: "White Tiger Frappuccino",
              koreanName: "화이트 타이거 프라푸치노",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "White Tiger Frappuccino"),
              price: 6500,
              description: "밀크 쉐이크 같은 부드럽고 달콤한 바닐라 그림 프라푸치노에 깊 은 풍미의 단맛을 가진 흑당시럽이 어우러져 용인에버랜드 백호의 줄무늬를 형상화한 부드럽고 달콤한 프라푸치노.",
              descriptionCaution: "용인에버랜드R 매장에서만 판매하는 음료입니다",
              allergyFactor: [.milk]),
      ]
    case .blended:
      return [
        .init(name: "Basil Lemon Sherbet Blended",
              koreanName: "바질 레몬 셔벗 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Basil Lemon Sherbet Blended"),
              price: 6500,
              description: "레몬, 망고의 새콤 달콤함과 바질 특유의 향이 만나 낮의 나른함 을 깨워줄 음료 바질, 루꼴라등 그린 채소의 건강함과 레몬, 망고의 조합.",
              descriptionCaution: "그린 베이스를 가볍게 섞어 드시면 더욱 맛있습니다",
              allergyFactor: []),
        .init(name: "Mint Chocolate Chip Blended",
              koreanName: "민트 초콜릿 칩 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Mint Chocolate Chip Blended"),
              price: 6300,
              description: "입 안 가득 상쾌한 민트 초콜릿과 부드러운 돌체 소스가 어우러진 초콜릿 블렌디드",
              descriptionCaution: "퍼스널 옵션의 돌체 시럽을 선택하여 당도를 조절해보세요.",
              allergyFactor: [.soybean, .wheat, .milk]),
        .init(name: "Strawberry Delight Yogurt Blended",
              koreanName: "딸기 딜라이트 요거트 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Strawberry Delight Yogurt Blended"),
              price: 6300,
              description: "유산균이 살아있는 리얼 요거트와 풍성한 딸기 과육이 더욱 상큼하게 어우러진 과일 요거트 블렌디드",
              descriptionCaution: "퍼스널 옵션의 돌체 시럽을 선택하여 당도를 조절해보세요.",
              allergyFactor: [.milk]),
        .init(name: "Mango Banana Blended",
              koreanName: "망고 바나나 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Mango Banana Blended"),
              price: 6300,
              description: "(Grande Only) 달콤한 망고 패션 프루트 주스에 바나나 1개가 통째로 들어간 신선한 블렌디드",
              descriptionCaution: "",
              allergyFactor: [.wheat, .milk]),
        .init(name: "Mango Passion Tea Blended",
              koreanName: "망고 패션 티 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Mango Passion Tea Blended"),
              price: 5400,
              description: "망고 패션 프루트 주스와 패션 댕고 티가 상큼하게 어우러진 과일 블렌디드",
              descriptionCaution: "",
              allergyFactor: [.soybean]),
        .init(name: "Red Power Smash Blended",
              koreanName: "레드 파워 스매시 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Red Power Smash Blended"),
              price: 6500,
              description: "붉은 색의 에너지로 가득 채워진 시원하고 상큼하게 즐기는 타트 체리 블렌디드 음료",
              descriptionCaution: "• ﻿﻿SSG랜더스필드 매장에서만 판매하는 음료입니다.\n• ﻿﻿sSG랜더스필드 매장은 랜더스필드 경기장 안에 있습니다.\n• ﻿﻿매장 상황에 따라 \"생 라임 없이\" 제공되는 점\n• 양해 부탁드립니다.",
              allergyFactor: []),
        .init(name: "The Green Mugwort Blended",
              koreanName: "더 그린 쑥 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "The Green Mugwort Blended"),
              price: 7200,
              description: "은은한 쑥과 곡물에 말차샷이 어우러져 고소하고 달콤하게 즐기는 블렌디드.",
              descriptionCaution: "더북한산, 더양평 DTR,더북한강R, 경동1960,대구종로고택 매장에서만 판매하는 음료입니다.",
              allergyFactor: []),
        .init(name: "Jeju Malcha & Apple Mango Blended",
              koreanName: "제주 말차 & 애플망고 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Jeju Malcha & Apple Mango Blended"),
              price: 7500,
              description: "제주 유채꽃 밭이 떠오르는 화사한 비주얼의 블렌디드 음료 제주 말차와 애플망고의 색다른 조합",
              descriptionCaution: "제주 지역 및 일부 매장에서만 판매합니다. (더양평DTR, 더북한강R, 더북한산, 이대R, 별다방, 대구종로고택, 경동1960)",
              allergyFactor: [.milk]),
        .init(name: "Jeju Golden Tangerine Blended",
              koreanName: "제주 금귤 듬뿍 블렌디드",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Jeju Golden Tangerine Blended"),
              price: 7500,
              description: "제주 금귤을 이용하여 누구나 맛있게 즐길 수 있는 과일 블렌디드 한 잔에 듬뿍 올라간 금귤 토핑이 인상적인 음료",
              descriptionCaution: "• ﻿음료 내 보일 수 있는 씨, 검은색 점은 원료에서 기인한 것으로, 취식에 이슈가 없으니 안심하고 드셔도 됩니다.\n• ﻿제주 지역만 판매",
              allergyFactor: []),
      ]
    case .physio:
      return [
        .init(name: "Yuja Passion Starbucks Fizzio",
              koreanName: "유자 패션 피지오",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Yuja Passion Starbucks Fizzio"),
              price: 5900,
              description: "상콤달콤 고흥 유자와 스타벅스 시그니처 패션 뱅고 티에 한 잔 한 잔 탄산을 넣어 제조하는 피지오 음료. 시트러스한 청량감을 가득 즐기세요!",
              descriptionCaution: "음료 사이즈에 맞는 스파클링 주입이 필요한 음료입니다.",
              allergyFactor: []),
        .init(name: "Cool Lime Starbucks Fizziom",
              koreanName: "쿨 라임 피지오",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Cool Lime Starbucks Fizziom"),
              price: 5900,
              description: "그린 빈 추출액이 들어간 라임 베이스에 건조된 라임 슬라이스를 넣고 스파클링한 시원하고 청량감 있는 음료입니다. (카페인이 _ 함유된 탄산음료입니다)",
              descriptionCaution: "",
              allergyFactor: []),
        .init(name: "Black Tea Lemonade Starbucks Fizziom",
              koreanName: "블랙 티 레모네이드 피지오",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Black Tea Lemonade Starbucks Fizziom"),
              price: 5400,
              description: "진하게 우린 블랙 티와 상큼한 레모네이드를 더한 청량감 있는 음료입니다.",
              descriptionCaution: "음료 사이즈에 맞는 스파클링 주입이 필요한 음료입니다.",
              allergyFactor: []),
        .init(name: "Passion Tango Tea Lemonade Starbucks Fizziom",
              koreanName: "패션 고 티 레모네이드 피지오",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Passion Tango Tea Lemonade Starbucks Fizziom"),
              price: 5400,
              description: "꽃 향기와 달콤하고 상큼한 시트러스 향을 탄산과 함께 더욱 풍 부하게 느끼고 싶으시다면 패션 티 레모네이드 피지오를 선택해 보세요! 언제 찾아도 기분이 좋아지는 훌륭한 음료입니다.",
              descriptionCaution: "음료 사이즈에 맞는 스파클링 주입이 필요한 음료입니다.",
              allergyFactor: []),
      ]
    case .teavana:
      return [
        .init(name: "Pink Flower Youthberry Tea",
              koreanName: "핑크 플라워 유스베리 티",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Pink Flower Youthberry Tea"),
              price: 6100,
              description: "달콤한 참외 베이스에 은은한 꽃 향을 더해 마치 꽃 한송이를 선 물 받는 듯한 음료",
              descriptionCaution: "음료 내 흰 과육은 참외 과육이니 안심하고 드셔도 됩니다. 핑크색 꽃잎은 모양이 조금씩 달라질 수 있으며, 개인컵 입구가 너무 좁거나 내부에 이물이 있는 등 꽃잎을 그리기 어려운 경우에는 음료 제공(꽃잎 제공)이 어려울 수 있습니다. 핑크 초콜릿(꽃잎)은 시간 경과 시 초콜릿이 굳어 떨어질 수 있습니다.",
              allergyFactor: []),
        .init(name: "Red Power Passion Tea",
              koreanName: "레드 파워 패션 티",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Red Power Passion Tea"),
              price: 5900,
              description: "딸기와 복숭아의 화사함에 패션 고티의 산뜻함을 더해한 모금 마시면 두근거리는 열정이 다시 떠오르는 리프레싱 티 음료",
              descriptionCaution: "카페인이 포함되어있는 티 음료 입니다",
              allergyFactor: []),
        .init(name: "Iced Earl Grey Vanilla Tea Latte",
              koreanName: "아이스 얼 그레이 바닐라 티 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Earl Grey Vanilla Tea Latte"),
              price: 6100,
              description: "2가지 티(블랙티, 얼 그레이 티)가 조화롭게 어우러지고 얼 그레이 폼과 바닐라의 풍미가 은은하게 퍼져 깔끔하고 부드러운 티 라떼 음료",
              descriptionCaution: "상기 이미지는 연출된 사진으로 실제 제공되는 제품과 상이할 수 있습니다.",
              allergyFactor: []),
        .init(name: "Iced Malcha Latte from Jeju Organic Farm",
              koreanName: "아이스 제주 유기농 말차로 만든 라떼",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Malcha Latte from Jeju Organic Farm"),
              price: 6100,
              description: "차광재배한 어린 녹찻잎을 곱게 갈아 깊고 진한 말차 본연의 맛 과 향을 부드럽게 즐길 수 있는 제주 유기농 말차로 만든 라떼",
              descriptionCaution: "",
              allergyFactor: [.milk]),
      ]
    case .others:
      return [
        .init(name: "Spring Strawberry Milk",
              koreanName: "봄 딸기 라떼",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Spring Strawberry Milk"),
              price: 6900,
              description: "상큼한 봄 딸기와 신선한 우유가 만나 부드럽고 달콤한 풍미를 느낄 수 있는 음료 국내산 제철 딸기의 신선함을 가득 담은 스타벅스의 딸기 라떼",
              descriptionCaution: "",
              allergyFactor: []),
        .init(name: "Vanilla Aftogato",
              koreanName: "바닐라 아포가토",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Vanilla Aftogato"),
              price: 5900,
              description: "유기농 바닐라 아이스크림에 스타벅스의 에스프레소를 부어 만든 달콤 쌉싸름한 이탈리아 정통 디저트입니다.",
              descriptionCaution: "• ﻿﻿에스프레소 샷은 블론드/디카페인으로 변경하여 즐기실 수 있습니다.\n• ﻿﻿디저트 컨셉으로 한정된 커스텀만 제공됩니다.",
              allergyFactor: []),
        .init(name: "Chocolate Affogato",
              koreanName: "초콜릿 아포가토",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Chocolate Affogato"),
              price: 5900,
              description: "유기농 초콜릿 아이스크림에 스타벅스의 에스프레소를 부어 만든 달콤 쌉싸름한 이탈리아 정통 디저트입니다.",
              descriptionCaution: "• ﻿﻿에스프레소 샷은 블론드/디카페인으로 변경하여 즐기실 수 있습니다.\n• ﻿﻿디저트 컨셉으로 한정된 커스텀만 제공됩니다.",
              allergyFactor: []),
        .init(name: "Java Chip Vanilla Affogato",
              koreanName: "자바 칩 바닐라 아포가토",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Java Chip Vanilla Affogato"),
              price: 6600,
              description: "유기농 바닐라 아이스크림에 스타벅스의 에스프레소를 붓고 달콤한 자바칩을 토핑한 아포가토입니다.",
              descriptionCaution: "• ﻿﻿에스프레소 샷은 블론드/디카페인으로 변경하여 즐기실 수 있습니다.\n• ﻿﻿디저트 컨셉으로 한정된 커스텀만 제공됩니다.",
              allergyFactor: []),
        .init(name: "Java Chip Chocolate Affogato",
              koreanName: "자바 칩 초콜릿 아포가토",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Java Chip Chocolate Affogato"),
              price: 6600,
              description: "유기농 초콜릿 아이스크림에 스타벅스의 에스프레소를 붓고 달콤한 자바칩을 토핑한 아포가토입니다",
              descriptionCaution: "• ﻿﻿에스프레소 샷은 블론드/디카페인으로 변경하여 즐기실 수 있습니다.\n• ﻿﻿디저트 컨셉으로 한정된 커스텀만 제공됩니다.",
              allergyFactor: []),
        .init(name: "Iced Signature Chocolate",
              koreanName: "아이스 시그니처 초콜릿",
              temperatureOptionType: .free,
              thumbnailImage: UIImage(named: "Iced Signature Chocolate"),
              price: 5700,
              description: "깊고 진한 초콜릿과 부드러운 휘핑크림이 입안에서 사르르녹는 프리미엄 초콜릿 음료",
              descriptionCaution: "",
              allergyFactor: [.milk]),
        .init(name: "Steamed Milk",
              koreanName: "스팀 우유",
              temperatureOptionType: .hotOnly,
              thumbnailImage: UIImage(named: "Steamed Milk"),
              price: 4100,
              description: "부드럽고 담백한 따뜻한 우유",
              descriptionCaution: "",
              allergyFactor: [.milk]),
        .init(name: "Milk",
              koreanName: "우유",
              temperatureOptionType: .icedOnly,
              thumbnailImage: UIImage(named: "Milk"),
              price: 4100,
              description: "부드럽고 담백한 신선한 우유.",
              descriptionCaution: "",
              allergyFactor: [.milk]),
      ]
    }
  }
}
