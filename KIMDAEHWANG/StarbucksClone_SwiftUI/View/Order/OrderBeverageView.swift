//
//  OrderBeverageView.swift
//  StarbucksClone_SwiftUI
//
//  Created by Mason Kim on 2023/04/09.
//

import SwiftUI

struct OrderBeverageView: View {
  
  enum Size {
    case tall
    case grande
    case venti
  }
  
  enum Temperature {
    case hot
    case cold
  }
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: OrderBeverageViewModel
  
  // MARK: - Body
  
  var body: some View {
    ScrollView {
      VStack {
        if let image = viewModel.beverage.thumbnailImage {
          Image(uiImage: image)
            .resizable()
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
        }
        
        VStack(alignment: .leading) {
          BeverageDescriptionView(beverage: $viewModel.beverage)
          
          HotIcePickerView(selectedTemperature: $viewModel.selectedTemperature)
        }
        
        if let descriptionCaution = viewModel.beverage.descriptionCaution {
          BeverageCautionView(caution: descriptionCaution)
        }
        
        BeverageAlergyView(alergyFactorText: viewModel.alergyFactorText)
        
        Text("사이즈 선택")
          .fontWeight(.semibold)
        
        Picker("선택", selection: $viewModel.selectedSize) {
          Text("Tall")
            .tag(Size.tall)
          
          Text("Grande")
            .tag(Size.grande)
          
          Text("Venti")
            .tag(Size.venti)
        }
        .pickerStyle(.segmented)
        .cornerRadius(20)
        
        
      }
      .padding(.horizontal, 15)
      
      Spacer()
      
      
    }
    .ignoresSafeArea()
    .navigationBarBackButtonHidden(true)
  }
}


struct OrderBeverageView_Previews: PreviewProvider {
  static var previews: some View {
    OrderBeverageView(viewModel: OrderBeverageViewModel(beverage: .recommend[2]))
  }
}

struct BeverageDescriptionView: View {
  @Binding var beverage: Beverage
  
  var body: some View {
    Text(beverage.koreanName)
      .font(.title)
      .fontWeight(.semibold)
      .padding(.top, 10)
    
    Text(beverage.name)
      .font(.caption)
      .foregroundColor(.secondary)
      .padding(.top, 2)
    
    if let description = beverage.description {
      Text(description)
        .font(.body)
        .padding(.top, 6)
    }
  }
}

struct BeverageCautionView: View {
  var caution: String
  
  var body: some View {
    ZStack {
      Color.secondary.opacity(0.2)
        .cornerRadius(10)
      Text(caution)
        .font(.caption)
        .fontWeight(.light)
        .lineLimit(2)
    }
    .frame(height: 60)
    .padding(.top, 20)
  }
}

struct HotIcePickerView: View {
  @Binding var selectedTemperature: OrderBeverageView.Temperature
  
  var body: some View {
    Picker("선택", selection: $selectedTemperature) {
      Text("HOT")
        .tag(true)
      
      Text("ICED")
        .tag(false)
    }
    .pickerStyle(.segmented)
    .cornerRadius(20)
  }
}

struct BeverageAlergyView: View {
  var alergyFactorText: String
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("알레르기 유발 요인")
        .fontWeight(.semibold)
      Text(alergyFactorText)
        .font(.caption)
    }.padding(.top, 20)
  }
}
