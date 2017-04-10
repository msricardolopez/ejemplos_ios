//
//  BookTableViewCell.swift
//  ParserExample
//
//  Created by Ricardo López on 25/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var book: Book! {
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
    
    // MARK: - Private methods
    
    private func configureCell() {
        titleLabel.text = book.title
        authorLabel.text = book.author
        priceLabel.text = book.price
    }

}
