//
//  AddNote.swift
//  App407
//
//  Created by IGOR on 18/03/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: NotesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New equipment")
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
                                    .opacity(viewModel.notTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notTitle)
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
                                
                                Text("Add")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.notNote.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.notNote)
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
                        
                        viewModel.addNote()
                        
                        viewModel.notTitle = ""
                        viewModel.notNote = ""
                        
                        viewModel.fetchNotes()
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                    })
                    .disabled(viewModel.notTitle.isEmpty || viewModel.notNote.isEmpty ? true : false)
                    .opacity(viewModel.notTitle.isEmpty || viewModel.notNote.isEmpty ? 0.5 : 1)
                    .padding(.vertical)
                }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddNote(viewModel: NotesViewModel())
}
