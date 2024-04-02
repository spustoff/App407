//
//  R1.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    HStack {
                        
                        Circle()
                            .fill(Color("prim2"))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim2").opacity(0.4))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim2").opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                    
                    Text("Budget profit")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("Track your money progress ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
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
    }
}

#Preview {
    R1()
}
