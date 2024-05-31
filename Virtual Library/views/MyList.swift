//
//  MyList.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 25/04/24.
//

import SwiftUI

struct MyList: View {
    @State private var books = Book.preview()
    @Binding var isMyListView: Bool
    @Binding var isHomeScreenView: Bool
    @State private var newBookName: String = "" // State variable to hold the new book name
    
    var body: some View {
        ZStack {
            Image("cobweb3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("HOME") {
                    self.isMyListView = false
                    self.isHomeScreenView = true
                }
                .foregroundColor(.brown)
                .font(Font.custom("PixelifySans-Regular", size: 40))
                .shadow(color: .black, radius: 10)
                .padding()
                
                Spacer() // Pushes "Books to Read" down
                
                Text("Books to Read")
                    .font(Font.custom("PixelifySans-Regular", size: 30)) // Larger font size
                    .fontWeight(.bold) // Bold
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 5) // Shadow
                    .padding() // Add padding
                
                List {
                    ForEach(books) { book in
                        Text(book.name)
                            .foregroundColor(.brown)
                            .listRowBackground(Image(""))
                            .shadow(color: .black ,radius: 5)
                    }
                    
                    HStack {
                        TextField("Enter Book Name", text: $newBookName)
                            .foregroundColor(.brown) // Set text field color to brown
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        Button(action: {
                            if !newBookName.isEmpty {
                                let toRead = Book(name: newBookName, favourite: false)
                                withAnimation {
                                    books.append(toRead)
                                    newBookName = "" // Clear the text field after adding the book
                                }
                            }
                        }) {
                            Image(systemName: "plus")
                                .font(Font.system(size: 30, weight: .bold))
                                .foregroundColor(.brown)
                                .shadow(radius: 10)
                        }
                        .padding(.horizontal)
                    }
                    .listRowBackground(Image(""))
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 5)
                }
                .font(Font.custom("PixelifySans-Regular", size: 25))
                .padding()
                .listStyle(PlainListStyle())
            }
        }
    }
}





#Preview {
    MyList(isMyListView: .constant(true), isHomeScreenView: .constant(false))
}

