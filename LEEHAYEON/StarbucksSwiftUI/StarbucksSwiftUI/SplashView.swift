//
//  SplashView.swift
//  StarbucksSwiftUI
//
//  Created by 이하연 on 2023/05/17.
//

import SwiftUI

struct SplashView: View {
    @State private var isShow = false
    
    var body: some View {
        
        ZStack {
            
            MainTabView()
            
            
            if !isShow {
                splashView.transition(.opacity)
            }

            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    isShow.toggle()
                }
            }
        }
    }
    
    var splashView: some View {
        VStack {
            
            HStack {
                Spacer()
            }
            
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.top, 200)
            
            Spacer()
        }.background(Color.accentGreen)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


//        NavigationView {
//
//            VStack {
//                NavigationLink(destination: MainTabView(), isActive: $isShow) {
//                    EmptyView()
//                }
//                .hidden()
//
//                HStack {
//                    Spacer()
//                }
//
//                Image("logo")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//                    .padding(.top, 200)
//
//                Spacer()
//
//
//            }
//            .background(Color.accentGreen)
//
//
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                withAnimation {
//                    isShow = true
//                }
//            }
//        }
//
