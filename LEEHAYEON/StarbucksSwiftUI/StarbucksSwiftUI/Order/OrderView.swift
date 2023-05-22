//
//  OrderView.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/04/29.
//

import SwiftUI

struct OrderView: View {
    
    @ObservedObject var viewModel = OrderViewModel()
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        NavigationView {
            orderView
                .navigationTitle("주문하기")
                .navigationBarItems(trailing: NavigationLink(destination: SearchView()){
                    Image("magnifying.glass").resizable()
                        .frame(width: 20, height: 20, alignment: .trailing)
                        .foregroundColor(.black)
                    
                })
        }
    }
    
    var orderView: some View {
        
        VStack {
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, alignment: .leading, spacing: 0) {
                    ForEach(viewModel.beverageList) { beverage in
                        
                        
                        NavigationLink(destination: OrderCategoryDetailView(category: beverage)) {
                            
                            VStack {
                                
                                HStack(spacing: 16) {
                                    Image(uiImage: beverage.thumbnailImage!)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(32)
                                    
                                    VStack(alignment: .leading) {
                                        Text(beverage.categoryTitle)
                                            .font(.custom("AppleSDGothicNeoR", size: 15))
                                            .foregroundColor(.textBase)
                                        
                                        
                                        Text(beverage.categorySubtitle)
                                            .font(.custom("AppleSDGothicNeoR", size: 13))
                                            .foregroundColor(.textSecondary)
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
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
