//
//  Join.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
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
                    .opacity(0)
                    
                    Text("Join and earn")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("Join our Telegram group trade with our team")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .regular))
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
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
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 14, weight: .regular))
                            .padding(5)
                            .background(Circle().fill(.white))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
