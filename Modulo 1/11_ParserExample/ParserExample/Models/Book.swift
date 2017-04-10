//
//  Book.swift
//  ParserExample
//
//  Created by Ricardo López on 18/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import Foundation

class Book {

    var id = ""
    var author = ""
    var title = ""
    var genre = ""
    var price = ""
    var publishDate = ""
    var bookDescription = ""
    
    init() { }
    
    init(id: String, author: String, title: String, genre: String, price: String, publishDate: String, bookDescription: String) {
        self.id = id
        self.author = author
        self.title = title
        self.genre = genre
        self.price = price
        self.publishDate = publishDate
        self.bookDescription = bookDescription
    }
    
}










