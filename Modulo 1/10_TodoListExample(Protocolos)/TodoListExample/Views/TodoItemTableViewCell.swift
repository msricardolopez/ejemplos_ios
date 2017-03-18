//
//  TodoItemTableViewCell.swift
//  TodoListExample
//
//  Created by Ricardo López on 04/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

protocol TodoCellDelegate {
    func todoCellToggleTodoAt(indexPath: IndexPath)
}

class TodoItemTableViewCell: UITableViewCell {

    @IBOutlet weak var todoTitleLabel: UILabel!
    
    var indexPath: IndexPath!
    var delegate: TodoCellDelegate?
    
    var todoItem: TodoItem! {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureCell() {
        //todoTitleLabel.text = todoItem.title
        if todoItem.done {
            let attributedString = NSAttributedString(string: todoItem.title, attributes: [
                NSStrikethroughStyleAttributeName : 1
                ])
            todoTitleLabel.attributedText = attributedString
        }
        else {
            let attributedString = NSAttributedString(string: todoItem.title)
            todoTitleLabel.attributedText = attributedString
        }
    }

    // MARK: - User interaction
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        print("Done button!")
        // -> NO!!!! todoItem.done = !todoItem.done
        delegate?.todoCellToggleTodoAt(indexPath: indexPath)
    }
    
}





