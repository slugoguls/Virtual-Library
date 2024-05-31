//
//  MyList.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 25/04/24.
//

import SwiftUI



struct MyLibrary: View {
    @State private var booksRead = Read.preview()
    @Binding var isMyLibraryView: Bool
    @Binding var isHomeScreenView: Bool
    @State private var readBookName: String = ""
    @State private var readAuthorName: String = "" // Added state variable for author name
    @State private var isEditingBookName = false
    
    var body: some View {
        ZStack {
            Image("cobweb3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("HOME") {
                    self.isMyLibraryView = false
                    self.isHomeScreenView = true
                }
                .foregroundColor(.brown)
                .font(Font.custom("PixelifySans-Regular", size: 40))
                .shadow(color: .black, radius: 10)
                .padding()
                
                Text("Your Collection")
                    .font(Font.custom("PixelifySans-Regular", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 10)
                
                Text("books your have read")
                    .font(Font.custom("PixelifySans-Regular", size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 10)
                List {
                    ForEach(booksRead) { book in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.brown)
                                .frame(height: 120)
                                .padding(.horizontal)
                                .shadow(color: .black, radius: 5)
                            
                            VStack {
                                Text(book.name)
                                    .foregroundColor(.black)
                                    .padding()
                                Text(book.author) // Display author name
                                    .foregroundColor(.black)
                                    .padding(.bottom) // Add padding between book name and author name
                            }
                        }
                        .listRowBackground(Image(""))
                        .shadow(color: .black, radius: 2)
                    }
                    
                    if isEditingBookName {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.brown)
                                .frame(height: 180) // Increased height to accommodate author name
                                .padding(.horizontal)
                                .shadow(color: .black, radius: 5)
                            
                            VStack {
                                TextField("Enter Book Name", text: $readBookName)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding(.top)
                                TextField("Enter Author Name", text: $readAuthorName) // Text field for author name
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                Button(action: {
                                    if !readBookName.isEmpty && !readAuthorName.isEmpty {
                                        let readBook = Read(name: readBookName, author: readAuthorName) // Pass author name
                                        withAnimation {
                                            booksRead.append(readBook)
                                            readBookName = ""
                                            readAuthorName = "" // Clear the text field after adding the book
                                            isEditingBookName.toggle()
                                        }
                                    }
                                }) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal)      
                            }
                        }
                        .foregroundColor(.brown)
                        .listRowBackground(Image(""))
                        .shadow(color: .black ,radius: 5)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.brown)
                                .frame(height: 60)
                                .padding(.horizontal)
                                .shadow(color: .black, radius: 5)
                            
                            HStack {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                Text("Add Book")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }
                        .listRowBackground(Image(""))
                        .foregroundColor(.brown)
                        .shadow(color: .black, radius: 5)
                        .onTapGesture {
                            isEditingBookName.toggle()
                        }
                    }
                }
                .font(Font.custom("PixelifySans-Regular", size: 25))
                .padding()
                .padding(.top)
                .listStyle(PlainListStyle())
            }
        }
    }
}





#Preview {
    MyLibrary(isMyLibraryView: .constant(true), isHomeScreenView: .constant(false))
}

