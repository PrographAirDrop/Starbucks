//
//  HomeView.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/04/29.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    @State private var currentPage = 0
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    var rows2: [GridItem] = Array(repeating: .init(.fixed(170)), count: 1)
    var rows3: [GridItem] = Array(repeating: .init(.fixed(215)), count: 1)
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        bannerView
                            .frame(height:300)
                            .padding(.bottom,20)
                        recommendView
                            .padding(.bottom,20)
                        whatsNewsView
                        Spacer()
                    }
                }
            }
            .navigationTitle("스타벅스 프로그라피점")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: HomeView()){
                Image("logo").resizable()
                    .frame(width: 32, height: 32, alignment: .leading)
            })
        }
        
    }
    
    var bannerView: some View {
        
        TabView(selection: $currentPage) {
            ForEach(viewModel.bannerList.indices, id: \.self) { index in
                
                let bannerInfo = viewModel.bannerList[index]
                
                VStack {
                    Image(uiImage: bannerInfo.item.thumbnailImage!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 280)
                        .cornerRadius(20)
                        .padding([.leading, .trailing], 10)
                        .tag(index)
                }
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .onAppear {
            currentPage = viewModel.bannerList.indices.first ?? 0
        }
        
    }

    
    var recommendView: some View {
        
        VStack {
            HStack {
                Text("이하연")
                    .font(.custom("AppleSDGothicNeoR", size: 20))
                    .bold()
                    .foregroundColor(.accentBrown)
                +
                Text("님을 위한 추천 메뉴")
                    .font(.custom("AppleSDGothicNeoR", size: 20))
                    .bold()
                
                Spacer()
            }
            .padding([.leading, .bottom], 20)
            
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows2, alignment: .top, spacing: 16) {
                        ForEach(viewModel.recommendList) { beverageInfo in
                            VStack(alignment: .leading, spacing: 12){
                                Image(uiImage: beverageInfo.thumbnailImage!)
                                    .resizable()
                                    .frame(width: 112, height: 112)
                                    .cornerRadius(56)
                                    .padding(.top, 0)
                                
                                Text(beverageInfo.koreanName)
                                    .font(.custom("AppleSDGothicNeoR", size: 15))
                                    .frame(width:112)
                                    .lineLimit(2)
                                    .foregroundColor(.textBase)
                                    .multilineTextAlignment(.center)
                                
                                
                            }
                        }
                    }
                }
            }
            .padding(.leading, 20)
            
        }
        
    }
    
    
    var whatsNewsView: some View {
        VStack {
            
            HStack {
                Text("What's new")
                    .font(.custom("AppleSDGothicNeoR", size: 20))
                    .bold()
                    .foregroundColor(.textBase)
                Spacer()
            }
            .padding(.bottom, 20)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows3, alignment: .top, spacing: 16) {
                        ForEach(viewModel.eventList) { eventInfo in
                            VStack(alignment: .leading, spacing: 0) {
                                Image(uiImage: eventInfo.thumbnailImage!)
                                    .resizable()
                                    .frame(width: 144, height: 144, alignment: .center)
                                    .cornerRadius(10)
                                    .padding(.bottom, 12)
                                
                                
                                Text(eventInfo.eventPeriod)
                                    .font(.custom("AppleSDGothicNeoR", size: 11))
                                    .foregroundColor(.textSecondary)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 4)
                                
                                
                                Text(eventInfo.title)
                                    .font(.custom("AppleSDGothicNeoR", size: 15))
                                    .foregroundColor(.textBase)
                                    .frame(width: 144, alignment: .leading)
                                    .lineLimit(2)
                                
                            }
                            
                        }
                    }
                }
            }
            
        }.padding(.leading, 20)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

