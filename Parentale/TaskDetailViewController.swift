//
//  TaskDetailViewController.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextViewDelegate {
    
    
    let formattedDate = DateFormatter()
    let formattedTime = DateFormatter()
    let currentDate = Date()
    var doesDeedExist = false
    var currentDeed : Deed = Deed()
    var isDescPlaceHolder = false
    var currentQuestion = ""
    
    @IBOutlet weak var imageBackView: FrostedUIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = themeColor
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 35
        backView.layer.backgroundColor = UIColor.white.cgColor
        
        imageBackView.layer.cornerRadius = 35
        imageBackView.clipsToBounds = true
        
        formattedDate.dateFormat = "EEEE, dd"
        formattedTime.dateFormat = "h mm a"
        descTextView.delegate = self
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeHolderSetup(textView: textView, isPlaceHolder: textView.text.isEmpty)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if doesDeedExist {
            dateLabel.text = formattedDate.string(from: currentDeed.getDate())
            titleLabel.text = currentDeed.getQuestion()
            timeLabel.text = formattedTime.string(from: currentDeed.getDate())
            descTextView.text = currentDeed.getDesc()
            placeHolderSetup(textView: descTextView, isPlaceHolder: false)
        } else {
            if !question.questionIsEmpty() {
                let newQuestion = question.getQuestion()
                currentQuestion = newQuestion!
                titleLabel.text = newQuestion!
                dateLabel.text = formattedDate.string(from: currentDate)
                timeLabel.text = formattedTime.string(from: currentDate)
                placeHolderSetup(textView: descTextView, isPlaceHolder: true)
            }
        }
    }
    @IBAction func saveClicked(_ sender: Any) {
        save()
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
    
    @IBAction func backClicked(_ sender: Any) {
        if currentDeed.getDesc() == descTextView.text || isDescPlaceHolder {
            if !self.doesDeedExist {
                question.addQuestion(question:self.currentQuestion)
            }
            self.performSegue(withIdentifier: "unwindToMain", sender: self)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You have not saved this deed, continue home?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(okAction)
            
            let deleteAction = UIAlertAction(title: "Continue", style: .default, handler: { (_) in
                if !self.doesDeedExist {
                    question.addQuestion(question:self.currentQuestion)
                }
                self.performSegue(withIdentifier: "unwindToMain", sender: self)
            })
            alert.addAction(deleteAction)
            
            present(alert, animated: true)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeHolderSetup(textView: textView, isPlaceHolder: textView.text.isEmpty)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    
    /*
     This method saves into deedArray Everytime, may change to optimise in the future by saving only when appCrashes
     */
    func save() {
        if let descStr = descTextView.text {
            guard !isDescPlaceHolder || descStr.isEmpty else {
                return
            }
            if doesDeedExist {
                if !descStr.isEmpty {
                    currentDeed.setDesc(desc: descStr)
                } else {
                    deedsCompiler.removeDeed(uuid: currentDeed.getId())
                }
            } else {
                if !descStr.isEmpty {
                    currentDeed.setDate(date: currentDate)
                    currentDeed.setDesc(desc: descStr)
                    currentDeed.setQuestion(question: currentQuestion)
                    deedsCompiler.addDeed(newDeed: currentDeed)
                    self.doesDeedExist = true
                }
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    func placeHolderSetup(textView: UITextView, isPlaceHolder: Bool) {
        if isPlaceHolder {
            textView.text = currentQuestion
            textView.textColor = UIColor.lightGray
            isDescPlaceHolder = true
        } else {
            if isDescPlaceHolder {
                textView.text = nil
                isDescPlaceHolder = false
            }
            textView.textColor = UIColor.black
        }
    }
}
