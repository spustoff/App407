//
//  EquipmentView.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct EquipmentView: View {

    @StateObject var viewModel = EquipmentViewModel()

    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCurr = true
                        }
                        
                    }, label: {
                        
                        Image("EURUSD")
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")))
                    })
                    
                    Spacer()
 
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
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

                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            
                            Text("Equipment price")
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .bold))
                            
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

                                Text("$\(viewModel.EquipmentMoney)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    if viewModel.equipments.isEmpty {
                        
                        VStack {
                            
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.equipments, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedEquipment = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDelete = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 10) {
                                                
                                                Text(index.eqTitle ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text(index.eqDate ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))

                                            }
                                            
                                            Spacer()
                                            
                                            Text("$\(index.eqMoney ?? "")")
                                                .foregroundColor(Color.black)
                                                .font(.system(size: 18, weight: .medium))
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
                    
                    Text("Edit statistic")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
    
                    HStack {
                        
                        Text("Total price")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .regular))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("$")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.Edengi.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.Edengi)
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                        })
                    }
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))

                    Button(action: {
                        
                        viewModel.EquipmentMoney = viewModel.Edengi
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddStatistics = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        
                    })
                    .padding(.top)
                    .opacity(viewModel.Edengi.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.Edengi.isEmpty ? true : false)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddStatistics ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchEquipments()
        }
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CurrenciesView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddEquip(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete this card?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteEquip(withEqTitle: viewModel.selectedEquipment?.eqTitle ?? "", completion: {
                            
                            viewModel.fetchEquipments()
                        })
                        
                        viewModel.fetchEquipments()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    EquipmentView()
}
