//
//  OptionsTableViewController.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class OptionsTableViewController: UITableViewController {

    var stringOptionsArray = ["What did I do with God?",
                              "What did I give my parents today?",
                              "How did I spend time with my parents today?",
                              "Add a new option"]
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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "optionCell",
            for: indexPath) as? OptionTableViewCell else {
            return
        }
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
}
