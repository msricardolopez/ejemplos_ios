//
//  TodoItemDetailTableViewCell.swift
//  TodoListExample
//
//  Created by Ricardo López on 04/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class TodoItemDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTitleLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var todoItem: TodoItem! {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private methods
    
    @objc private func handleLongPressure() {
        print("Marcar item como terminado")
    }

    private func configureCell() {
        
        if todoItem.done {
            let attributedString = NSAttributedString(string: todoItem.title ?? "Sin título", attributes: [
                NSStrikethroughStyleAttributeName : 1
                ])
            todoTitleLabel.attributedText = attributedString
        }
        else {
            let attributedString = NSAttributedString(string: todoItem.title ?? "Sin título")
            todoTitleLabel.attributedText = attributedString
        }
        
        notesLabel.text = todoItem.notes
    }
}



