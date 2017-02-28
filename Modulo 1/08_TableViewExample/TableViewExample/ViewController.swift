//
//  ViewController.swift
//  TableViewExample
//
//  Created by Ricardo López on 25/02/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    fileprivate var planetsArray: [Planet] = []
    fileprivate var studentsArray: [Student] = []
    fileprivate var dataSource: [[Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mercurio = Planet(name: "Mercurio", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let venus = Planet(name: "Venus", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let tierra = Planet(name: "Tierra", planetDescription: "Es un planeta del sistema solar que gira alrededor de su estrella —el Sol— en la tercera órbita más interna. Es el más denso y el quinto mayor de los ocho planetas del sistema solar. También es el mayor de los cuatro terrestres.")
        let marte = Planet(name: "Marte", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let jupiter = Planet(name: "Júpiter", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let saturno = Planet(name: "Saturno", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let urano = Planet(name: "Urano", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let neptuno = Planet(name: "Neptuno", planetDescription: "Aquí vamos a poner la descripción del planeta")
        let pluton = Planet(name: "Plutón", planetDescription: "Aquí vamos a poner la descripción del planeta")
        planetsArray.append(mercurio)
        planetsArray.append(venus)
        planetsArray.append(tierra)
        planetsArray.append(marte)
        planetsArray.append(jupiter)
        planetsArray.append(saturno)
        planetsArray.append(urano)
        planetsArray.append(neptuno)
        planetsArray.append(pluton)
        
        let ricardo = Student(name: "Ricardo", language: "Swift 3.0")
        let cesar = Student(name: "César", language: "Swift 3.0")
        let jonathan = Student(name: "Jonathan", language: "Swift 3.0")
        let miguel = Student(name: "Miguel", language: "Swift 3.0")
        let enrique = Student(name: "Enrique", language: "Swift 3.0")
        
        studentsArray.append(ricardo)
        studentsArray.append(cesar)
        studentsArray.append(jonathan)
        studentsArray.append(miguel)
        studentsArray.append(enrique)
        
        dataSource.append(planetsArray)
        dataSource.append(studentsArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PlanetDetailViewController" {
            
            let planetDetailViewController = segue.destination as! PlanetDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let planet = planetsArray[indexPath.row]
            planetDetailViewController.planet = planet
        }
    }
    
    // MARK: - User interaction
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        tableView.setEditing(!tableView.isEditing, animated: true)
        editButton.title = tableView.isEditing ? "Listo" : "Editar"
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell")!
            let planet = dataSource[indexPath.section][indexPath.row] as! Planet
            cell.textLabel?.text = planet.name
            // Agerga un pequeño icono a la celda para indicar que existe un detalle
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell")!
            let student = dataSource[indexPath.section][indexPath.row] as! Student
            cell.textLabel?.text = student.name
            cell.detailTextLabel?.text = student.language
            cell.accessoryType = .detailButton
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seleccionado...")
        if indexPath.section == 0 {
            performSegue(withIdentifier: "PlanetDetailViewController", sender: self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Button tapped")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Planetas"
        }
        else {
            return "Estudiantes"
        }
    }
    
    // Funciones para editar celdas
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // El usuario está intentando eliminar un estudiante
            print("Delete student...")
            dataSource[indexPath.section].remove(at: indexPath.row)
            
            if dataSource[indexPath.section].count == 0 {
                dataSource.remove(at: indexPath.section)
                let indexSet = IndexSet(integer: indexPath.section)
                tableView.deleteSections(indexSet, with: .automatic)
            }
            else {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
            
//            CATransaction.begin()
//            tableView.beginUpdates()
//            CATransaction.setCompletionBlock({
//                print("Después de la animación")
//                tableView.reloadData()
//            })
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
//            CATransaction.commit()
            
        }
    }

    // Estos métodos se usan para el reordenamiento de la tabla
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return (indexPath.section == 0) ? false : true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let studentToMove = dataSource[sourceIndexPath.section][sourceIndexPath.row]
        dataSource[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        dataSource[destinationIndexPath.section].insert(studentToMove, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        }
        return proposedDestinationIndexPath
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "😱"
    }

}




















