//
//  U1.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    HStack {
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim").opacity(0.4))
                            .frame(width: 8, height: 8)
    
                    }
                    
                    Text("Grow with us")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("Achieve goals to be more successful")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            .padding(.vertical)
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
