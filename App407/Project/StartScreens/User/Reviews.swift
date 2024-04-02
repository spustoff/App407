//
//  Reviews.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    HStack {
                        
                        Circle()
                            .fill(Color("prim2").opacity(0.4))
                            .frame(width: 8, height: 8)
    
                        Circle()
                            .fill(Color("prim2"))
                            .frame(width: 8, height: 8)

                    }
                    
                    Text("Rate app")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("Leave your opinion about our App")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        if isTelegram == true {
                            
                            Join(telegram: telegram)
                                .navigationBarBackButtonHidden()
                            
                        } else if isTelegram == false {
                            
                            Not()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                            .padding(.vertical)
                    })
                }
                .padding()
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "h")!, isTelegram: false)
}
