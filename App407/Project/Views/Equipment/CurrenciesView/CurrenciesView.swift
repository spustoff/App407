//
//  CurrenciesView.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel: EquipmentViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency pair")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white.ignoresSafeArea())
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentCurrency = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isChart = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 6) {
                                        
                                        Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))%")
                                            .foregroundColor(.green)
                                            .font(.system(size: 11, weight: .regular))
                                        
                                        Text("$\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9)))),\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .medium))
                                    }
                                }
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            ChartView(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrenciesView(viewModel: EquipmentViewModel())
}
