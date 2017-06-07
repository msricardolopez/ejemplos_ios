//
//  TodoTextField.swift
//  TodoListExample
//
//  Created by Ricardo López on 11/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class TodoTextField: FloatLabelTextField {
    
    var showLine = false

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setStrokeColor(UIColor.lightGray.cgColor)
            context.setLineWidth(1)
            context.move(to: CGPoint(x: 0, y: bounds.size.height - 1))
            context.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height - 1))
            context.strokePath()
        }
    }
}




