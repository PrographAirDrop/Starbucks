//
//  OrderCategoryDetailView.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/05/17.
//

import SwiftUI

struct OrderCategoryDetailView: View {
    
    var category: Beverage.Category
    init(category: Beverage.Category) {
        self.category = category
    }
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        NavigationView {
            categoryDetailView
                .navigationTitle(category.categoryTitle)
                .navigationBarItems(trailing: NavigationLink(destination: SearchView()){
                    Image("magnifying.glass").resizable()
                        .frame(width: 20, height: 20, alignment: .trailing)
                        .foregroundColor(.black)
                    
                })
        }
    }
    
    var categoryDetailView: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 0) {
                    ForEach(category.beverages) { beverage in
                        
                        VStack {
                            
                            HStack(spacing: 16) {
                                Image(uiImage: beverage.thumbnailImage!)
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                    .cornerRadius(32)
                                
                                VStack(alignment: .leading) {
                                    Text(beverage.koreanName)
                                        .font(.custom("AppleSDGothicNeoR", size: 15))
                                        .foregroundColor(.textBase)
                                    
                                    
                                    Text(beverage.name)
                                        .font(.custom("AppleSDGothicNeoR", size: 11))
                                        .foregroundColor(.textSecondary)
                                    
                                    Text("\(beverage.price)")
                                        .font(.custom("AppleSDGothicNeoR", size: 15))
                                        .foregroundColor(.textBase)
                                }
                                Spacer()
                                
                            }
                            .padding([.top, .bottom], 12)
                            .padding(.leading, 20)
                            
                        }
                    }
                }
            }
        }
    }
}

//struct OrderCategoryDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderCategoryDetailView(category: Beverage.Category)
//    }
//}
