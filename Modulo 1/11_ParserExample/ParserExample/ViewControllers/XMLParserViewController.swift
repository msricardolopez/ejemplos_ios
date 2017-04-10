//
//  XMLParserViewController.swift
//  ParserExample
//
//  Created by Ricardo López on 18/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
import Alamofire

class XMLParserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: [Book] = []
    fileprivate var auxBook: Book!
    fileprivate var auxString: String!
    fileprivate let refreshControl = UIRefreshControl()
    private var manager: SessionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(loadBooks), for: .valueChanged)
        
        tableView.addSubview(refreshControl)
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        manager = SessionManager(configuration: configuration)
        
        loadBooks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookDetailViewController" {
            let bookDetailViewController =  segue.destination as! BookDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            bookDetailViewController.book = dataSource[indexPath.row]
        }
    }
    
    // MARK: - Private methods
    
    @objc private func loadBooks() {
        
        manager.request(Constants.API.XMLUrl)
        //.validate(statusCode: 205..<215)
        .validate() // Valida que la respuesta tenga un response code entre 200 y 299
        .responseData { (response) in
            
            switch response.result {
            case .success:
                print(response.result.value!)
                if let xmlData = response.result.value {
                    self.dataSource.removeAll()
                    
                    let parser = XMLParser(data: xmlData)
                    parser.delegate = self
                    parser.parse()
                    print("Parseamos \(self.dataSource.count) libros")
                    print(self.dataSource)
                    self.tableView.reloadData()
                    self.refreshControl.endRefreshing()
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }

}

// MARK: - XMLParserDelegate

extension XMLParserViewController: XMLParserDelegate {

    // Este método nos indica que se encontró una llave nueva
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("Inicia elemento \(elementName)")
        
        if elementName == "book" {
            auxBook = Book()
            if let id = attributeDict["id"] {
                auxBook.id = id
            }
        }
    }
    
    // Los caracteres encontrados entre el inicio y fin de una llave
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("Caracteres: \(string)")
        auxString = string.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // Este método nos indica que se cerró una llave
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("Cierra elemento \(elementName)")
        if elementName == "author" {
            auxBook.author = auxString
        }
        else if elementName == "title" {
            auxBook.title = auxString
        }
        else if elementName == "genre" {
            auxBook.genre = auxString
        }
        else if elementName == "price" {
            auxBook.price = auxString
        }
        else if elementName == "publish_date" {
            auxBook.publishDate = auxString
        }
        else if elementName == "description" {
            auxBook.bookDescription = auxString
        }
        else if elementName == "book" {
            dataSource.append(auxBook)
        }
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension XMLParserViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as! BookTableViewCell
        cell.book = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "BookDetailViewController", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}






