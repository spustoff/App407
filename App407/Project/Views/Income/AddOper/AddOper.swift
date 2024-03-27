//
//  AddOper.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct AddOper: View {

    @StateObject var viewModel: IncomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New income")
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
                        
                        HStack {
                            
                            Text("Title")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.incTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.incTitle)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                        .padding(1)
                    
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Date")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.incDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.incDate)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                        .padding(1)
                    
                        HStack {
                            
                            Text("Hours")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Hours")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.incHours.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.incHours)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Money made")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.incMoney.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.incMoney)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                        .padding(1)
                        
                        HStack {
                            
                            Text("Note")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Add note")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.incNote.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.incNote)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.4)))
                        .padding(1)

                    Button(action: {
                        
                        viewModel.incOper = viewModel.currentAddOper
                        
                        viewModel.addIncome()
                        
                        viewModel.incTitle = ""
                        viewModel.incDate = ""
                        viewModel.incHours = ""
                        viewModel.incNote = ""
                        viewModel.incMoney = ""
                        
                        viewModel.fetchIncomes()
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                    })
                    .disabled(viewModel.incTitle.isEmpty || viewModel.incDate.isEmpty || viewModel.incHours.isEmpty || viewModel.incMoney.isEmpty || viewModel.incNote.isEmpty ? true : false)
                    .opacity(viewModel.incTitle.isEmpty || viewModel.incDate.isEmpty || viewModel.incHours.isEmpty || viewModel.incMoney.isEmpty || viewModel.incNote.isEmpty ? 0.5 : 1)
                    .padding(.vertical)
                }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddOper(viewModel: IncomeViewModel())
}
