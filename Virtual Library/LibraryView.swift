//
//  ContentView.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 24/04/24.
//

import SwiftUI
    
struct LibraryView: View {
    @State private var isHomeScreenView = true
    @State private var isMyListView = false
    @State private var isMyLibraryView = false
    @State private var isQuoteView = false
    
    var body: some View {
        VStack {
            if isHomeScreenView {
                HomeScreenView(isHomeScreenView: $isHomeScreenView, isMyListView: $isMyListView, isMyLibraryView: $isMyLibraryView, isQuoteView: $isQuoteView)
            } else if isMyListView {
                MyList(isMyListView: $isMyListView, isHomeScreenView: $isHomeScreenView)
            } else if isMyLibraryView {
                MyLibrary(isMyLibraryView: $isMyLibraryView, isHomeScreenView: $isHomeScreenView)
            } else if isQuoteView {
                QuoteView(isQuoteView: $isQuoteView, isHomeScreenView: $isHomeScreenView)
            }
        }
    }
}

#Preview {
    LibraryView()
}
