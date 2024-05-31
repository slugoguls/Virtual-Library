//
//  quotes.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 29/04/24.
//

import Foundation

struct Quote: Identifiable {
    var id = UUID()
    var text: String
    var author: String
    
    static func preview() -> [Quote] {
        []
    }
}
