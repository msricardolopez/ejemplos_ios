//
//  BookDetailViewController.swift
//  ParserExample
//
//  Created by Ricardo López on 25/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var book: Book!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Recibí: \(book.title)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        dateFormatter.locale = Locale(identifier: "ES_MX")
        //dateFormatter.dateStyle = .full
        if let publishDate = dateFormatter.date(from: book.publishDate) {
            //dateFormatter.dateFormat = "dd/MMM/YYYY"
            dateFormatter.dateFormat = "dd 'de' MMMM 'de' YYYY"
            print("La fecha nueva: \(dateFormatter.string(from: publishDate))")
        }
        
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

}
