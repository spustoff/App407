//
//  IncomeView.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct IncomeView: View {
    
    @StateObject var viewModel = IncomeViewModel()
    
    @Namespace var animation
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isSettings = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "gearshape")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Menu(content: {
                        
                        ForEach(viewModel.operations, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentAddOper = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Text(index)
                            })
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus.circle")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .regular))
                    })
                }
                .padding(.horizontal)
                                    
                    if viewModel.city.isEmpty {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddCity = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "mappin")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .bold))
                                
                                Text("Tap to add a city")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .bold))
                            })
                            
                            Spacer()
                            
                        }
                        .padding()
                        
                    } else {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddCity = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "mappin")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .bold))
                                
                                Text(viewModel.city)
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .bold))
                            })
                            
                            Spacer()
                            
                        }
                        .padding()
                    }
                
                VStack {
                
                    HStack {
                        
                        ForEach(viewModel.operations, id: \.self) { index in
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.currentOper = index
                                }
                                
                                viewModel.fetchIncomes()
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 30)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(viewModel.currentOper == index ? 1 : 0))
                                    .padding(1)
                            })
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            
                            Text("Statistics")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddStatistics = true
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "pencil")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("Edit")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                            })
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Money recieved")
                                    .foregroundColor(.black)
                                    .font(.system(size: 11, weight: .regular))
                                
                                Text("$\(viewModel.money)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Time spent")
                                    .foregroundColor(.black)
                                    .font(.system(size: 11, weight: .regular))
                                
                                Text("\(viewModel.spent)h")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    if viewModel.incomes.isEmpty {
                        
                        VStack {
                            
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.incomes, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedIncome = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Text(index.incDate ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 11, weight: .regular))
                                            
                                            Text(index.incTitle ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 20, weight: .bold))
                                            
                                            Text("\(index.incDate ?? "") / \(index.incHours ?? "") hours")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                    })
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
             }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCity ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCity = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCity = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Change city")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Write down city")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.gorod.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.gorod)
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(Rectangle().fill(.white))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.city = viewModel.gorod
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCity = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCity = false
                            }
                            
                        }, label: {
                            
                            Text("Exit")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .padding(.top)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isAddCity ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddStatistics ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddStatistics = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddStatistics = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Edit statistics")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Money recieved")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.dengi.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.dengi)
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(Rectangle().fill(.white))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Time spent")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.chasi.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.chasi)
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .background(Rectangle().fill(.white))

                    HStack {
                        
                        Button(action: {
                            
                            viewModel.money = viewModel.dengi
                            viewModel.spent = viewModel.chasi
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddStatistics = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddStatistics = false
                            }
                            
                        }, label: {
                            
                            Text("Exit")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                    .padding(.top)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isAddStatistics ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchIncomes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddOper(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            OperDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
    }
}

#Preview {
    IncomeView()
}
