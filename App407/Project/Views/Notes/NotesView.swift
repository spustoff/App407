//
//  NotesView.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
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
                            
                            Text("\(Int(viewModel.notes.count)) notes")
                                .foregroundColor(.black)
                                .font(.system(size: 24, weight: .bold))
                            
                            Spacer()
                            
                        }
                        
                        Text("To add a note click a plus icon on top")
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    if viewModel.notes.isEmpty {
                        
                        VStack {
                            
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.notes, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedNote = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDetail = true
                                        }
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                            Text(index.notTitle ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text(index.notNote ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 12, weight: .regular))
                                            
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
        .onAppear {
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            NotesDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    NotesView()
}
