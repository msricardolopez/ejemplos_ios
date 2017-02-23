//
//  ViewController.swift
//  ClasesYMetodos
//
//  Created by Ricardo López on 28/01/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hola mundo!")
        
        let x = 0   // Constante implícita Int
        let name = "Ricardo" // Constante implícita String
        let y: Int = 1 // Constante explícita Int
        let lastName: String = "López" // Constante explícita String
        
        print(x)
        print("Y vale: \(y)")
        print(name + lastName)
        print("\(name) \(lastName)")
        
        // let -> Constante
        // var -> Variable
        
        var suma = 0
        suma = x + y
        print("Suma \(suma)")
        
        print("******** ARREGLOS ********")
        
        let myArray = [1,2,3,4,5] // Arreglo implícito de Int
        let myArray2: [Int] = [1,2,3] // Arreglo explícito de Int
        let myArray3: [Any] = ["Ricardo", 1, 2.3, true]
        
        print(myArray)
        print(myArray2)
        print(myArray3)
        
        print("Pos 2: \(myArray[2])")
        
        // Sentencia for each
        
        for item in myArray {
            print("Item: \(item)")
        }
        
        // Sentencia for normal
        
        for x in 0..<10 {
            print("Valor de x: \(x)")
        }
        
        print("******** DICCIONARIOS ********")
        
        // Diccionario implícito [String: String]
        var dictionary = [
            "llave" : "VALOR"
        ]
        
        dictionary["llave"] = "NUEVO VALOR"
        dictionary["llave2"] = "NUEVO VALOR DOS"
        
        print(dictionary)
        
        print(dictionary["llave"])
        print(dictionary["asdf"] ?? "SIN VALOR")
        
        if let valor = dictionary["llaveasdf"] {
            print("VALOR IF LET: \(valor)")
        }
        else {
            print("SIN VALOR IF LET")
        }
        
        print("******** FUNCIONES ********")
        
        sayHello()
        let miSuma = sumarEnteros(numA: 5, numB: 4)
        print("Mi suma: \(miSuma)")
        
        let multiples = multiplesValores()
        print(multiples.0)
        print(multiples.1)
        print(multiples.2)
        
        let multiplesDos = multiplesValoresAlias()
        print(multiplesDos.nombre)
        print(multiplesDos.edad)
        print(multiplesDos.pi)
        
        print("*****CLASES****")
        
        let person = Person(name: "Ricardo López", age: 29, genre: "Masculino")
        print(person)
        person.sayHello()
        
        let person2 = Person(name: "Cesar Guzman", age: 29, genre: "Masculino")
        print(person2)
        person2.sayHello()
        
        let developer = Developer(name: "Isaac Velazquez", age: 27, genre: "Masculino", language: "Swift 3.0")
        developer.sayHello()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private methods
    
    func sayHello() {
        print("Mi primer función :)")
    }
    
    func sumarEnteros(numA: Int, numB: Int) -> Int {
        let suma = numA + numB
        return suma
    }
    
    // FUNCIÓN CON MULTIPLES VALORES DE RETORNO
    func multiplesValores() -> (Int, String, Double) {
        return (10, "Hola mundo", 2.5)
    }
    
    func multiplesValoresAlias() -> (edad: Int, nombre: String, pi: Double) {
        return(29, "Ricardo", 3.1416)
    }
    
}







