//
//  ViewController.swift
//  Parentale
//
//  Created by Justin Lim on 10/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

var question = Question()
var deedsCompiler = DeedsCompiler()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var formattedDate = DateFormatter()

    @IBOutlet weak var deedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        view.backgroundColor = themeColor
        
        deedTableView.delegate = self
        deedTableView.dataSource = self
        deedTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        formattedDate.dateFormat = "d MMM"
        
        let testDeed = Deed(date: Date(), desc: "TESTING", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed)
        
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        deedTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deedsCompiler.size()
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if question.questionIsEmpty() {
            performSegue(withIdentifier: "messageSegue", sender: self)
        } else {
            performSegue(withIdentifier: "deedDetailsSegue", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "deedTextCell", for: indexPath) as! DeedTextTableViewCell
        
        let index = indexPath.row
        
        cell.dateLabel.text = formattedDate.string(from: deedsCompiler.getDeed(byIndex: index).date)
        cell.descLabel.text = deedsCompiler.getDeed(byIndex: index).desc
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "deedDetailsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier
        {
            if identifier == "deedDetailsSegue"
            {
                if let indexPath = deedTableView.indexPathForSelectedRow {
                    let selectedDeed = deedsCompiler.getDeed(byIndex: indexPath.row)
                    let destinationVC = segue.destination as! TaskDetailViewController
                    
                    destinationVC.currentDeed = selectedDeed
                    destinationVC.doesDeedExist = true
                }
            } else {
                let destinationVC = segue.destination as! MessageViewController
                
                destinationVC.titleStr = "YAY THERE IS NO MORE QUESTIONS TODAY"
            }
        }
        
        
    }
    
    
    

}

