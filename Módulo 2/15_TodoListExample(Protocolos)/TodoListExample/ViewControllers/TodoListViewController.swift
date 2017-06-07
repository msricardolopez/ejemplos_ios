//
//  TodoListViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 04/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UIViewController {

    var list: List!
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: [TodoItem] = []
    fileprivate var detailActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableViewAutomaticDimension
        
//        // Descomentar para generar un Item en base de datos
//        let myFirstTodoCoreData = TodoItem(context: CoreDataManager.sharedInstance.context())
//        myFirstTodoCoreData.title = "Mi primer todo Item en CoreData"
//        myFirstTodoCoreData.done = false
//        myFirstTodoCoreData.notes = "Notas de mi primer Todo :)"
//        CoreDataManager.sharedInstance.saveContext()
        
        //readTodosFromDataBase()
        
        title = list.name
        
        // Obtenemos los todos de la lista que acabamos de recibir
        if let items = list.items?.allObjects as? [TodoItem] {
            dataSource = items
        }
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
        
        if segue.identifier == "CreateTodoViewController" {
            let createTodoViewController = segue.destination as! CreateTodoViewController
            createTodoViewController.delegate = self
            createTodoViewController.list = list
        }
    }
    
    // MARK: - Private methods
    
    private func readTodosFromDataBase() {
        
        let context = CoreDataManager.sharedInstance.context()
        let request: NSFetchRequest = TodoItem.fetchRequest()
        let results = try! context.fetch(request)
        dataSource = results
        tableView.reloadData()
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
            cell.indexPath = indexPath
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}

// MARK: - CreateTodoDelegate

extension TodoListViewController: CreateTodoDelegate {

    func createTodoDidCreateTodoItem(todoItem: TodoItem) {
        
        // Aquí recibimos el todo desde la vista de creación
        print("Llegó el item correctamente")
        
        dataSource.append(todoItem)
        let indexPath = IndexPath(row: dataSource.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - TodoCellDelegate

extension TodoListViewController: TodoCellDelegate {

    func todoCellToggleTodoAt(indexPath: IndexPath) {
        // Aquí cambiamos de estado el todo y refrescamos la UI
        let todoItem = dataSource[indexPath.row]
        todoItem.done = !todoItem.done
        CoreDataManager.sharedInstance.saveContext()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}











