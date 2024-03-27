//
//  ChartView.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct ChartView: View {
    
    @StateObject var viewModel: EquipmentViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
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
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(viewModel.currentCurrency)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .regular))
                    
                    HStack {
                        
                        Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9)))),\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))%")
                            .foregroundColor(.green)
                            .font(.system(size: 11, weight: .regular))
                        
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 80)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                
                Image("chart")
                    .resizable()
                
                HStack {
                    
                    HStack {
                        
                        Button(action: {
                                                        
                            viewModel.isChart = false
                            viewModel.isCurr = false
                            
                        }, label: {
                            
                            Text("Apply")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.green))
                        })
                        .padding(.leading)
                        
                        Button(action: {
                                                        
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                        })
                        .padding(.trailing)
                    }
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ChartView(viewModel: EquipmentViewModel())
}
