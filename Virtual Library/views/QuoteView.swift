

import SwiftUI

struct QuoteView: View {
    @State private var quotes = Quote.preview()
    @Binding var isQuoteView: Bool
    @Binding var isHomeScreenView: Bool
    @State private var newQuoteText: String = ""
    @State private var newQuoteAuthor: String = ""
    @State private var isEditingQuote = false
    
    var body: some View {
        ZStack {
            Image("cobweb3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("HOME") {
                    self.isQuoteView = false
                    self.isHomeScreenView = true
                }
                .foregroundColor(.brown)
                .font(Font.custom("PixelifySans-Regular", size: 40))
                .shadow(color: .black, radius: 10)
                .padding()
                
                Text("Your Quotes")
                    .font(Font.custom("PixelifySans-Regular", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 10)
                    .padding(.top)
                
                List {
                    ForEach(quotes) { quote in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.brown)
                                .frame(height: 120)
                                .padding(.horizontal)
                                .shadow(color: .black, radius: 5)
                            
                            VStack {
                                Text(quote.text)
                                    .foregroundColor(.black)
                                    .padding()
                                Text(quote.author) // Display author name
                                    .foregroundColor(.black)
                                    .padding(.bottom) // Add padding between quote text and author name
                            }
                        }
                        .listRowBackground(Image(""))
                        .shadow(color: .black, radius: 2)
                    }
                    
                    if isEditingQuote {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.brown)
                                .frame(height: 180) // Increased height to accommodate author name
                                .padding(.horizontal)
                                .shadow(color: .black, radius: 5)
                            
                            VStack {
                                TextField("Enter Quote", text: $newQuoteText)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                TextField("Enter Book", text: $newQuoteAuthor) // Text field for author name
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                                Button(action: {
                                    if !newQuoteText.isEmpty && !newQuoteAuthor.isEmpty {
                                        let quote = Quote(text: newQuoteText, author: newQuoteAuthor) // Pass author name
                                        withAnimation {
                                            quotes.append(quote)
                                            newQuoteText = ""
                                            newQuoteAuthor = "" // Clear the text field after adding the quote
                                            isEditingQuote.toggle()
                                        }
                                    }
                                }) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.black)
                                        .padding()
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
                                Text("Add Quote")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }
                        .listRowBackground(Image(""))
                        .foregroundColor(.brown)
                        .shadow(color: .black, radius: 5)
                        .onTapGesture {
                            isEditingQuote.toggle()
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
    QuoteView(isQuoteView: .constant(true), isHomeScreenView: .constant(false))
}


