//
//  CreateSpending.swift
//  TravelMate
//
//  Created by Naomi Herimandimby on 10/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import UIKit

class CreateSpendingController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var tripName: UITextField!
    @IBOutlet weak var pickerTextField: UITextField!
    @IBOutlet weak var sum: UITextField!
    @IBOutlet weak var payList: UIView!
    
    var pickerData: [String] = []
    var name: String = ""
    var index: Int = 0
    var tripIndex: Int = 0
    var selectors: [UISwitch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Populate the paying list, not a great way to do this... Should use StackViews
        for (i, name) in pickerData.enumerated() {
            let label = UILabel(frame: CGRect(x: 20, y: 10 + (60 * i), width: 100, height: 40))
            label.text = name
            let check = UISwitch(frame: CGRect(x: 300, y: 10 + (60 * i), width: 50, height: 40))
            selectors.append(check)
            payList.addSubview(label)
            payList.addSubview(check)
        }
        
        let pickerView = UIPickerView()
        pickerTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        index = row
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
    }
    
    @IBAction func saveSpending(_ sender: Any) {
        var data = Trip.loadData()
        //Parse the form to create a new Spending object and save it
        var payedFor: [Person] = []
        for (i, s) in selectors.enumerated() {
            if s.isOn {
                payedFor.append(data[tripIndex].getParticipants()[i])
            }
        }
        if let value = sum.text {
            data[tripIndex].addSpending(toAdd: Spending(p1: data[tripIndex].getParticipants()[index], p2: payedFor, v: Float(value)!))
            Trip.saveData(travels: data)
        }
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
