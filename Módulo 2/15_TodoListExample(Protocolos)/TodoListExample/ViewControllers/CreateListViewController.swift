//
//  CreateListViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 12/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

protocol CreateListDelegate {
    func createListDidCreate(list: List)
}

class CreateListViewController: UIViewController {

    @IBOutlet weak var nameTextField: TodoTextField!
    
    var delegate: CreateListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - User interaction
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let name = nameTextField.text else { return }
        
        let context = CoreDataManager.sharedInstance.context()
        let list = List(context: context)
        list.name = name
        CoreDataManager.sharedInstance.saveContext()
        delegate?.createListDidCreate(list: list)
    }
}
