//
//  MenuDetailView.swift
//  StarbucksClone
//
//  Created by 이승기 on 2023/04/07.
//

import SwiftUI

struct MenuDetailView: View {
  
  // MARK: - Constants
  
  enum Constants {
    static let allergyFactorSectionHeaderTitle = "알러지 유발 요인"
    static let sizeOptionSectionHeaderTitle = "사이즈 선택"
    static let cupOptionSectionHeaderTitle = "컵 선택"
  }
  
  enum Metric {
    static let navigationViewHorizontalSpacing = 20.f
    static let navigationViewVerticalSpacing = 12.f
    
    static let backButtonBackgroundLightOpacity = 0.1.f
    static let backButtonBackgroundDarkOpacity = 0.5.f
    static let backButtonSize = 36.f
    static let backButtonPadding = 8.f
    
    static let backButtonChangeAppearanceThreshold = 100.f
    
    static let contentSpacing = 0.f
    static let contentHorizontalSpacing = 20.f
    static let contentTopSpacing = 12.f
    static let contentBottomSpacing = 200.f
    
    static let menuNameFontSize = 24.f
    static let menuSubNameFontSize = 11.f
    static let menuSubNamePadding = 12.f
    
    static let descriptionFontSize = 13.f
    static let descriptionPadding = 16.f
    
    static let temperatureOptionTopPadding = 20.f
    
    static let cautionBoxTopPadding = 28.f
    
    static let allergyFactorFontSize = 15.f
    static let allergyFactorDescriptionFontSize = 12.f
    static let allergyFactorTopPadding = 20.f
    
    static let menuOptionSectionPadding = 20.f
  }
  
  
  // MARK: - Properties
  
  @ObservedObject var viewModel: MenuDetailViewModel
  @Environment(\.presentationMode) var presentationMode
  @State var backButtonBackgroundColor = Color(R.color.backgroundBase).opacity(Metric.backButtonBackgroundLightOpacity)
  
  
  // MARK: - Views
  
  var body: some View {
    NavigationView {
      ZStack {
        ScrollViewOffset {
          VStack {
            GeometryReader { proxy in
              StretchableImageHeader(image: Image(uiImage: viewModel.beverage.thumbnailImage!))
            }
            .frame(height: UIScreen.main.bounds.width)
            
            VStack(alignment: .leading, spacing: Metric.contentSpacing) {
              Text(viewModel.beverage.koreanName)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: Metric.menuNameFontSize, weight: .bold))
                .foregroundColor(Color(R.color.textBase))
              
              Text(viewModel.beverage.name)
                .multilineTextAlignment(.leading)
                .font(.system(size: Metric.menuSubNameFontSize))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(R.color.textSecondary))
                .padding(.top, Metric.menuSubNamePadding)
              
              Text(viewModel.beverage.description ?? "")
                .multilineTextAlignment(.leading)
                .font(.system(size: Metric.descriptionFontSize))
                .foregroundColor(Color(R.color.textBase))
                .padding(.top, Metric.descriptionPadding)
              
              TemperatureOptionView(
                selectedOption: $viewModel.temperatureOption,
                temperatureOptionType: viewModel.beverage.temperatureOptionType)
              .frame(maxWidth: .infinity)
              .padding(.top, Metric.temperatureOptionTopPadding)
              
              DescriptionTextBox(text: viewModel.beverage.descriptionCaution ?? "")
                .frame(maxWidth: .infinity)
                .padding(.top, Metric.cautionBoxTopPadding)
              
              if viewModel.beverage.allergyFactor.isEmpty == false {
                VStack(alignment: .leading, spacing: 8) {
                  Text(Constants.allergyFactorSectionHeaderTitle)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: Metric.allergyFactorFontSize, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                  
                  Text(viewModel.beverage.allergyFactorDescription)
                    .font(.system(size: Metric.allergyFactorDescriptionFontSize, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, Metric.allergyFactorTopPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
              }
              
              MenuOptionSectionView(title: Constants.sizeOptionSectionHeaderTitle)
                .padding(.top, Metric.menuOptionSectionPadding)
              SizeOptionSelectorView(selectedSizeOption: $viewModel.selectedSize)
                .frame(maxWidth: .infinity)
              
              MenuOptionSectionView(title: Constants.cupOptionSectionHeaderTitle)
                .padding(.top, Metric.menuOptionSectionPadding)
              CupOptionSegmentedControl(selectedOption: $viewModel.cupOption)
              .padding(.bottom, Metric.contentBottomSpacing)
            }
            .padding(.top, Metric.contentTopSpacing)
            .padding(.horizontal, Metric.contentHorizontalSpacing)
          }
        } onOffsetChange: { offset in
          withAnimation {
            if offset >= -(UIScreen.main.bounds.width - Metric.backButtonChangeAppearanceThreshold) {
              backButtonBackgroundColor = Color(R.color.backgroundBase).opacity(Metric.backButtonBackgroundLightOpacity)
            } else {
              backButtonBackgroundColor = Color(R.color.accentBlack).opacity(Metric.backButtonBackgroundDarkOpacity)
            }
          }
        }
        .edgesIgnoringSafeArea(.top)
        
        VStack {
          HStack {
            Button() {
              presentationMode.wrappedValue.dismiss()
            } label: {
              Image(R.image.chevronLeft)
                .resizable()
                .scaledToFit()
                .padding(Metric.backButtonPadding)
                .frame(width: Metric.backButtonSize,
                       height: Metric.backButtonSize)
                .foregroundColor(Color(R.color.iconWhite))
            }
            .background(backButtonBackgroundColor)
            .clipShape(Circle())
            
            Spacer()
          }
          .padding(.horizontal, Metric.navigationViewHorizontalSpacing)
          .padding(.vertical, Metric.navigationViewVerticalSpacing)
          
          Spacer()
          
          MenuOrderToolBar(menu: viewModel.beverage)
        }
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}


// MARK: - Preview

struct MenuDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = MenuDetailViewModel(beverage: Beverage.Category.coldBrew.beverages.first!)
    MenuDetailView(viewModel: viewModel)
  }
}
