//
//  HolidayTableViewController.swift
//  TravelMate
//
//  Created by Liam Powell on 03/12/2018.
//  Copyright © 2018 Liam Powell. All rights reserved.
//

import UIKit

class TripTableViewController: UITableViewController, CreateTripProtocol {
    var data: [Trip] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        data = Trip.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell", for: indexPath)

        cell.textLabel?.text = data[indexPath.row].getName()
        cell.detailTextLabel?.text = "Voyage de \(data[indexPath.row].getParticipants().count) personnes"

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let barVC = segue.destination as? UITabBarController {
            let selection = data[tableView.indexPathForSelectedRow!.row]
            barVC.navigationItem.title = selection.getName()
            //Obtient le contrôleur depuis la tab bar
            barVC.viewControllers?.forEach {
                if let vc = $0 as? UINavigationController {
                    if let target = vc.viewControllers[0] as? ParticipantDetailViewController {
                        target.index = tableView.indexPathForSelectedRow!.row
                        target.travel = selection
                    }
                }
            }
        }
        
        if let createVC = segue.destination as? CreateTripController {
            createVC.delegate = self
            createVC.trips = self.data
        }
    }
    
    func reloadData() {
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
