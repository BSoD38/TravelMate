//
//  CreateTrip.swift
//  TravelMate
//
//  Created by Liam Powell on 10/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import UIKit

protocol CreateTripProtocol {
    func reloadData()
}

class CreateTripController: UIViewController {
    public var trips: [Trip] = []

    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var personCount: UILabel!
    @IBOutlet weak var personCountStepper: UIStepper!
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var oldValue = 0.0
    var subviews: [DynamicPersonForm] = []
    
    var delegate: CreateTripProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        personCount.text = String(Int(personCountStepper.value))
        oldValue = personCountStepper.value
    }

    
    @IBAction func onStepperChange() {
        personCount.text = String(Int(personCountStepper.value))
        if(oldValue < personCountStepper.value) {
            let vi: DynamicPersonForm = DynamicPersonForm(frame: CGRect(x: 0, y: 100 + 100 * subviews.count, width: 350, height: 100))

            scrollView.addSubview(vi)
            scrollView.sizeToFit()
            subviews.append(vi)
            oldValue += 1
        } else {
            if let vi = subviews.last {
                vi.removeFromSuperview()
                subviews.removeLast()
                oldValue -= 1
            }
        }
    }
    
    //Create trip object and save it to existing data, if fields are valid
    @IBAction func validateAction(_ sender: Any) {
        if !subviews.isEmpty {
            var participants : [Person] = []
            for view in subviews {
                if let name = view.getName(), let budget = view.getBudget() {
                    participants.append(Person(n: name, b: budget))
                } else {
                    return
                }
            }
            if let sTripName = tripName.text {
                trips.append(Trip(n: sTripName, p: participants, s: []))
                Trip.saveData(travels: trips)
                delegate?.reloadData()
//                if let cStack = self.navigationController?.viewControllers, cStack.count >= 2{
//                    if let controller = cStack[cStack.count - 2] as? TripTableViewController {
//                        controller.tableView.reloadData()
//                    }
//                }
                _ = navigationController?.popToRootViewController(animated: true)
            } else {
                return
            }
        }
    }
}
