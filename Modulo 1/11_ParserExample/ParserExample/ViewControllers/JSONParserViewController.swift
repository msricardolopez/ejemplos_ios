//
//  JSONParserViewController.swift
//  ParserExample
//
//  Created by Ricardo López on 18/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
import Alamofire

class JSONParserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadBooks()
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
    
    // MARK: - Private methods
    
    private func loadBooks() {
    
        Alamofire.request(Constants.API.JSONUrl)
        .validate()
        .responseJSON { (response) in
            
            switch response.result {
            case .success:
                //print(response.result.value)

                if let jsonObject = response.result.value as? [String: Any] {
                    // Tenemos un JSON válido
                    if let catalogDict = jsonObject["catalog"] as? [String: Any] {
                        // Tenemos un catálogo válido
                        //print("Estamos a nivel del catálogo")
                        if let booksArray = catalogDict["books"] as? [[String: Any]] {
                            // Tenemos un arreglo válido de diccionarios book
                            print("Vamos a parsear \(booksArray.count) libros")
                            
                            for bookDict in booksArray {
                                // Estamos al nivel del diccionario de libro
                                guard let id = bookDict["id"] as? String else { continue }
                                guard let author = bookDict["author"] as? String else { continue }
                                guard let title = bookDict["title"] as? String else { continue }
                                guard let genre = bookDict["genre"] as? String else { continue }
                                guard let publishDate = bookDict["publish_date"] as? String else { continue }
                                guard let price = bookDict["price"] as? String else { continue }
                                guard let bookDescription = bookDict["description"] as? String else { continue }
                                
                                let book = Book(id: id, author: author, title: title, genre: genre, price: price, publishDate: publishDate, bookDescription: bookDescription)
                                self.dataSource.append(book)
                            }
                            
                            print("Libros \(self.dataSource.count)")
                            self.tableView.reloadData()
                        }
                    }
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension JSONParserViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCellTwo")!
        let book = dataSource[indexPath.row]
        cell.textLabel?.text = book.author
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}














