//
//  R3.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    HStack {
      
                        Circle()
                            .fill(Color("prim").opacity(0.4))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim").opacity(0.4))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 8, height: 8)
                        
                    }
                    
                    Text("Useful notes")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 26, weight: .bold))
                    
                    Text("Write down notes and grow")
                        .foregroundColor(Color("prim"))
                        .font(.system(size: 16, weight: .regular))
                    
                    Button(action: {
                        
                  status = true
                        
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
    R3()
}
