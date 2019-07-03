//
//  OptionsTableViewController.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//


import UIKit

class OptionsTableViewController: UITableViewController {

    var stringOptionsArray = ["What did I do with God?","What did I give my parents today?","How did I spend time with my parents today?","Add a new option"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Init all false
        for option in stringOptionsArray {
            optionArray.append(Option.init(name: option, completed: false))
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stringOptionsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath) as!OptionTableViewCell
        
        cell.optionLabel.text = optionArray[indexPath.row].getName()
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "taskDetails", sender: self)
    }
    
    
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "taskDetails" {
            print("UMM")
            if let destinationVC = segue.destination as? TaskDetailViewController {
                print("HELLO")
            }
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        if (segue.identifier == "showQuestionnaire") {
//            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! QuestionnaireController
//            let row = (sender as! NSIndexPath).row; //we know that sender is an NSIndexPath here.
//            let patientQuestionnaire = patientQuestionnaires[row] as! PatientQuestionnaire
//            controller.selectedQuestionnaire = patientQuestionnaire
//        }
//    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
