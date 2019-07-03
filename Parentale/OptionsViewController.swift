//
//  OptionsViewController.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

var optionArray = [Option]()
class OptionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var optionsTableView: UITableView!
    var stringOptionsArray = ["What did I do with my parents today?","What did I give my parents today?","How did I spend time with my parents today?","Add a new option"]
    var selectedOption: Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTableView.dataSource = self
        optionsTableView.delegate = self
        
        // Init all false
        for option in stringOptionsArray {
            optionArray.append(Option.init(name: option, completed: false))
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stringOptionsArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath) as!OptionTableViewCell
        cell.optionLabel.text = optionArray[indexPath.row].getName()
        // Configure the cell...
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "taskDetails" {
            if let destinationVC = segue.destination as? TaskDetailViewController {
                if let optionInt = selectedOption {
                    destinationVC.titleString = optionArray[optionInt].getName()
                } else {
                    print("Error with selectedOption")
                }
                
            }
        }

    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
            selectedOption = indexPath.row
//            performSegue(withIdentifier: "taskDetails", sender: self)
        }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("I EXIST HERRO")
    }
    
        
        @IBAction func close(segue: UIStoryboardSegue) {

        }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
