//
//  LoadingView.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("prim2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo_big")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
