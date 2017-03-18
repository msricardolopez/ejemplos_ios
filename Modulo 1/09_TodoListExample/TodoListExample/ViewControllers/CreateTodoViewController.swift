//
//  CreateTodoViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 11/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: TodoTextField!
    @IBOutlet weak var notesTextField: TodoTextField!
    
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
        print("Save todo")
    }
}









