//
//  DynamicPersonForm.swift
//  TravelMate
//
//  Created by Liam Powell on 10/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import UIKit

class DynamicPersonForm: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Create subviews in view
        let nameField = UITextField()
        nameField.frame = CGRect(x: 20, y: 10, width: 345, height: 30)
        nameField.placeholder = "Nom"
        self.addSubview(nameField)
        let budgetField = UITextField()
        budgetField.frame = CGRect(x: 20, y: 50, width: 345, height: 30)
        budgetField.keyboardType = .decimalPad
        budgetField.placeholder = "Budget"
        self.addSubview(budgetField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Oh no, something went wrong! (DynamicPersonForm)")
    }
}
