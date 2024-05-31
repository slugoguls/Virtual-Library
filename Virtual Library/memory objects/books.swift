//
//  books.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 26/04/24.
//

import Foundation

struct Book: Identifiable{
    
    var id = UUID()
    var name: String
    
    static func preview() -> [Book] {
        []
    }
}
