//
//  DynamicPersonForm.swift
//  TravelMate
//
//  Created by Liam Powell on 10/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import UIKit

class DynamicPersonForm: UIView {
    let nameField = UITextField()
    let budgetField = UITextField()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 345, height: 100)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Create subviews in view
        
        nameField.frame = CGRect(x: 20, y: 10, width: 345, height: 30)
        nameField.placeholder = "Nom"
        nameField.borderStyle = .roundedRect
        self.addSubview(nameField)
        budgetField.frame = CGRect(x: 20, y: 50, width: 345, height: 30)
        budgetField.keyboardType = .decimalPad
        budgetField.placeholder = "Budget"
        budgetField.borderStyle = .roundedRect
        self.addSubview(budgetField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Oh no, something went wrong! (DynamicPersonForm)")
    }
    
    func getName() -> String? {
        return nameField.text
    }
    
    func getBudget() -> Float? {
        if let value = budgetField.text {
            return Float(value)
        } else {
            return nil
        }
    }
}
