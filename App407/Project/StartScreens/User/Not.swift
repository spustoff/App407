//
//  Not.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
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
                    
                    Text("Don’t miss anything")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .regular))
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                            status = true
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notifications")
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
                    
                    Button(action: {
                        
                        status = true
                        
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
    Not()
}
