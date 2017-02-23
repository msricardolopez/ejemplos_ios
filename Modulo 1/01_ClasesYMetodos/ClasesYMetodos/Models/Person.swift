//
//  Person.swift
//  ClasesYMetodos
//
//  Created by Ricardo López on 28/01/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {

    var name = ""
    var age = 0
    var genre = ""
    
    init(name: String, age: Int, genre: String) {
        self.name = name
        self.age = age
        self.genre = genre
    }
    
    func sayHello() {
        print("Hola, soy \(name) tengo \(age) años y mi género es: \(genre)")
    }
    
    var description: String {
        return "Person: \(name) - \(age)"
    }
}

class Developer: Person {

    var language = ""
    
    init(name: String, age: Int, genre: String, language: String) {
        super.init(name: name, age: age, genre: genre)
        self.language = language
    }
    
    override func sayHello() {
        super.sayHello()
        print("Y programo en \(language)")
    }
    
}















