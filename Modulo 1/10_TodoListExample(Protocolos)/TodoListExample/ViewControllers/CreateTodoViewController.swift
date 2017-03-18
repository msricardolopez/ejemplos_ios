//
//  CreateTodoViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 11/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

protocol CreateTodoDelegate {
    func createTodoDidCreateTodoItem(todoItem: TodoItem)
}

class CreateTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: TodoTextField!
    @IBOutlet weak var notesTextField: TodoTextField!
    
    var delegate: CreateTodoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - User interaction
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let title = titleTextField.text else { return }
        guard let notes = notesTextField.text else { return }
        
        if !title.isEmpty {
            dismiss(animated: true) {
                let todoItem = TodoItem(title: title, notes: notes)
                self.delegate?.createTodoDidCreateTodoItem(todoItem: todoItem)
            }
        }
        else {
            
            let alertController = UIAlertController(title: "Oups!", message: "Debes tener al menos un título para guardar el item", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}









