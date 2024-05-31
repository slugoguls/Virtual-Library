//
//  BooksRead.swift
//  Virtual Library
//
//  Created by Varun Chaaras on 28/04/24.
//

import Foundation

struct Read: Identifiable {

    var id = UUID()
    var name: String
    var author: String
    
    static func preview()  -> [Read]{
        []
    }
}
