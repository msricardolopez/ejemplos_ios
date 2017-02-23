//
//  VisualFormatLanguageViewController.swift
//  ScrollViewExample
//
//  Created by Ricardo López on 18/02/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class VisualFormatLanguageViewController: UIViewController {

    @IBOutlet weak var contentScrollView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 1600))
//        redView.backgroundColor = UIColor(red: 30/255.0, green: 120/255.0, blue: 160/255.0, alpha: 1)
//        contentScrollView.addSubview(redView)
//        redView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let horizontalFormat = "H:|-[redView]-|"
//        let verticalFormat = "V:|-150-[redView(1200)]-|"
//        
//        let views = [
//            "redView" : redView
//        ]
//        
//        let horizontalContraint = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormat, options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: views)
//        let verticalConstraint = NSLayoutConstraint.constraints(withVisualFormat: verticalFormat, options: NSLayoutFormatOptions.alignAllFirstBaseline, metrics: nil, views: views)
// 
//        contentScrollView.addConstraints(horizontalContraint)
//        contentScrollView.addConstraints(verticalConstraint)
     
        createViews(numberOfViews: 20)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func createViews(numberOfViews: Int) {
        
        var verticalViews: [String: Any] = [:]
        var verticalFormatArray: [String] = []
        
        for x in 0..<numberOfViews {
            
            let view = UIView()
            view.backgroundColor = UIColor.lightGray
            view.translatesAutoresizingMaskIntoConstraints = false
            
            contentScrollView.addSubview(view)
            
            let viewStr = "view\(x)"
            verticalViews[viewStr] = view
            
            verticalFormatArray.append("[\(viewStr)(ALTURA)]")
            
            let horizontalViews = [
                viewStr : view
            ]
            
            let horizontalFormatStr = "H:|-10-[\(viewStr)]-10-|"
            
            print(horizontalFormatStr)
            // Generamos las constraints y las añadimos
            let horizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: horizontalFormatStr, options: .alignAllFirstBaseline, metrics: nil, views: horizontalViews)
            contentScrollView.addConstraints(horizontalContraints)
        }
        
        print(verticalFormatArray)
        
        let verticalFormatStr = "V:|-10-\(verticalFormatArray.joined(separator: "-10-"))-10-|"
        
        print(verticalFormatStr)
        
        let metrics = [
            "ALTURA" : 100
        ]
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: verticalFormatStr, options: .alignAllLeft, metrics: metrics, views: verticalViews)
        contentScrollView.addConstraints(verticalConstraints)
    }
}














