//
//  TaskDetailViewController.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate {

    
    let formattedDate = DateFormatter()
    let formattedTime = DateFormatter()
    let currentDate = Date()
    var currentQuestion: String = ""
    var doesDeedExist = false
    var currentDeed : Deed = Deed()
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descTextField: OneSecondUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = themeColor
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 35
        backView.layer.backgroundColor = UIColor.white.cgColor
        
        formattedDate.dateFormat = "EEEE, dd"
        formattedTime.dateFormat = "h mm a"
        descTextField.delegate = self
        
        descTextField.actionClosure = {
            self.save()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if doesDeedExist {
            dateLabel.text = formattedDate.string(from: currentDeed.getDate())
            titleLabel.text = currentDeed.getQuestion()
            timeLabel.text = formattedTime.string(from: currentDeed.getDate())
            descTextField.text = currentDeed.getDesc()
        } else {
            if let question = question.getQuestion() {
                titleLabel.text = question
                currentQuestion = question
            }
            
            dateLabel.text = formattedDate.string(from: currentDate)
            timeLabel.text = formattedTime.string(from: currentDate)
        }
        
        
    }
    
    @IBAction func backClicked(_ sender: Any) {
        save()
    }
    //    func textFieldDidEndEditing(_ textField: UITextField) {
//        save()
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    
    /*
     This method saves into deedArray Everytime, may change to optimise in the future by saving only when appCrashes
     */
    func save() {
        if let descStr = descTextField.text {
            if doesDeedExist {
                if !descStr.isEmpty {
                    currentDeed.setDesc(desc: descStr)
                    print("Update Executed")
                } else {
                    // Delete Current
                }
            } else {
                if !descStr.isEmpty {
                    currentDeed.setDate(date: currentDate)
                    currentDeed.setDesc(desc: descStr)
                    currentDeed.setQuestion(question: currentQuestion)
                    deedsCompiler.addDeed(newDeed: currentDeed)
                    self.doesDeedExist = true
                    
                    print("Save executed")
                    print(deedsCompiler)
                }
            }
        }
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
