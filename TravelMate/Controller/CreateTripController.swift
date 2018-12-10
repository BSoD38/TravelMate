//
//  CreateTrip.swift
//  TravelMate
//
//  Created by Liam Powell on 10/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import UIKit

class CreateTripController: UIViewController {
    public var trips: [Trip] = []

    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var personCount: UILabel!
    @IBOutlet weak var personCountStepper: UIStepper!
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        personCount.text = String(Int(personCountStepper.value))
    }

    
    @IBAction func onStepperChange() {
        personCount.text = String(Int(personCountStepper.value))
        stackView.addArrangedSubview(DynamicPersonForm())
    }
}
