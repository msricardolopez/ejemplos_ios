//
//  ListsViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 29/04/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
import CoreData

class ListsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Descomentar para insertar un elemento en CoreData
//        let list = List(context: CoreDataManager.sharedInstance.context())
//        list.name = "Mi primer lista CoreData"
//        CoreDataManager.sharedInstance.saveContext()
        
        loadListsFromDatabase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "TodoListViewController" {
            let todoListViewController = segue.destination as! TodoListViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let list = dataSource[indexPath.row]
            todoListViewController.list = list
        }
        else if segue.identifier == "CreateListViewController" {
            let createListViewController = segue.destination as! CreateListViewController
            createListViewController.delegate = self
        }
    }
    
    // MARK: - Private methods
    
    private func loadListsFromDatabase() {
    
        let context = CoreDataManager.sharedInstance.context()
        let request: NSFetchRequest = List.fetchRequest()
        let results = try! context.fetch(request)
        dataSource = results
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        let list = dataSource[indexPath.row]
        cell.textLabel?.text = list.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TodoListViewController", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CreateListDelegate

extension ListsViewController: CreateListDelegate {

    func createListDidCreate(list: List) {
        dataSource.append(list)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}






