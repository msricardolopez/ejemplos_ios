//
//  TodoListViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 04/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: [TodoItem] = []
    fileprivate var detailActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //generateDummyData()
        
        if let todosDict = readJsonToDict(fileName: "todos.json") {
            print("Archivo leído correctamente")
            if let todosArray = todosDict["todos"] as? [[String: Any]] {
                print("Tenemos \(todosArray.count) todos")
                for todoDict in todosArray {
                    //print("TODO: \(todoDict)")
                    let todoItem = TodoItem(dict: todoDict)
                    dataSource.append(todoItem)
                }
            }
        }
        else {
            // No existe el diccionario
        }
        
        //print(dataSource)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        detailActive = UserDefaults.standard.bool(forKey: "DETAIL_ACTIVE")
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK: - Private methods
    
    private func generateDummyData() {
    
        // 1) Generamos diccionarios de todos
        // 2) Añadimos los diccionarios a un arreglo
        // 3) Los escribimos en un archivo
        
        let todoDict: [String: Any] = [
            "title" : "Estudiar Swift",
            "notes" : "Necesitamos aprender a programar bien iOS",
            "done" : false
        ]
        
        let todoDict2: [String: Any] = [
            "title" : "Comprar leche",
            "notes" : "Buscar deslactosada porque si no, me duele el estómago",
            "done" : true
        ]
        
        let todoDict3: [String: Any] = [
            "title" : "Comprar crakets",
            "notes" : "Ya se va a terminar mi mega paquete",
            "done" : false
        ]
        
        let todoDict4: [String : Any] = [
            "title": "Planchar ropa",
            "notes": "Conseguir una plancha para poder hacerlo",
            "done": false
        ]
        
        let todos = [
            "todos" : [todoDict, todoDict2, todoDict3, todoDict4]
        ]
        
        writeDictToJson(dict: todos, fileName: "todos.json")
    }
    
    private func writeDictToJson(dict: [String: Any], fileName: String) {
    
        // 1) Transformamos nuestro diccionario en Data
        // 2) Transformamos el Data en String
        // 3) Buscamos el directorio de documentos donde podemos escribir
        // 4) Generamos el path completo para nuestro archivo
        // 5) Escribirmos el archivo en el directorio
        
        let data = try! JSONSerialization.data(withJSONObject: dict, options: [.prettyPrinted])
        let jsonString = String(data: data, encoding: .utf8)
        
//        print(data)
//        print("***************")
//        print(jsonString)
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
//        print(paths)
//        print(documentsDirectory)
        
        let completePath = documentsDirectory.appending("/\(fileName)")
        
        print(completePath)
        
        do {
            try jsonString?.write(toFile: completePath, atomically: true, encoding: .utf8)
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    private func readJsonToDict(fileName: String) -> [String: Any]? {
        
        // 1) Obtener el path de documents
        // 2) Obtenemos el path completo del archivo
        // 3) Leemos el contenido a un String
        // 4) Transformamos el String a Dictionary
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let completePath = documentsDirectory.appending("/\(fileName)")
        
        var dict: [String: Any]?
        
        do {
            let jsonString = try String(contentsOfFile: completePath, encoding: .utf8)
            if let data = jsonString.data(using: .utf8) {
                let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                dict = jsonDict
            }
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
        
        return dict
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TodoListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if detailActive {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemDetailTableViewCell") as! TodoItemDetailTableViewCell
            cell.todoItem = dataSource[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemTableViewCell") as! TodoItemTableViewCell
            cell.todoItem = dataSource[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}











