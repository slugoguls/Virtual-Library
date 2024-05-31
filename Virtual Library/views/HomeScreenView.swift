//
//  HomeScreenView.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 25/04/24.
//

import SwiftUI

struct HomeScreenView: View {
    @Binding var isHomeScreenView: Bool
    @Binding var isMyListView: Bool
    @Binding var isMyLibraryView: Bool
    @Binding var isQuoteView: Bool
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                VStack{
                    Text("VIRTUAL LIBRARY")
                        .foregroundColor(.brown)
                        .font(Font.custom("PixelifySans-Regular", size: 45))
                        .shadow(color: .white, radius: 25)
                    Text("A place to hold your books")
                        .foregroundColor(.brown)
                        .font(Font.custom("PixelifySans-Regular", size: 15))
                        .shadow(color: .white, radius: 25)
                }
                .padding()
                
                ZStack{
                    Image("bookshelf")
                        .resizable()
                        .frame(width: 450, height: 550)
                        .padding()
                        .shadow(color: .gray, radius: 10)
                    
                    Button("My List"){
                        self.isHomeScreenView = false
                        self.isMyListView = true
                    }
                    .position(CGPoint(x: 250.0, y: 160.0))
                    .font(Font.custom("PixelifySans-Regular", size: 30))
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 10)
                    
                    Button("My Library"){
                        self.isHomeScreenView = false
                        self.isMyLibraryView = true
                    }
                    .position(CGPoint(x: 200.0, y: 260.0))
                    .font(Font.custom("PixelifySans-Regular", size: 30))
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 10)
                    
                    Button("My Quotes"){
                        self.isHomeScreenView = false
                        self.isQuoteView = true
                    }
                    .position(CGPoint(x: 290.0, y: 360.0))
                    .font(Font.custom("PixelifySans-Regular", size: 30))
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 10)
                }
                Spacer()
            }

        }
    }
}

#Preview {
    HomeScreenView(isHomeScreenView: .constant(true), isMyListView: .constant(false), isMyLibraryView: .constant(false), isQuoteView: .constant(false))
}
