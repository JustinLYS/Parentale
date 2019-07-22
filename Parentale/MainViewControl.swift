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

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var formattedDate = DateFormatter()
    var isDetailSegueAdd = false

    
    @IBOutlet weak var deedCollectionView: UICollectionView! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        
        view.backgroundColor = themeColor
        
        deedCollectionView.delegate = self
        deedCollectionView.dataSource = self
//        deedCollectionView.register(UINib(nibName: "TextDeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "textDeedCell")

//        deedCollectionView.register(TextDeedCollectionViewCell.self, forCellWithReuseIdentifier: "textDeedCell")
        

                
        formattedDate.dateFormat = "d MMM"
        
        let testDeed = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed)
        
    }
    
    
    @IBAction func close(segue: UIStoryboardSegue) {
        deedCollectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deedsCompiler.size()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = deedCollectionView.dequeueReusableCell(withReuseIdentifier: "textDeedCell", for: indexPath)
            as! TextDeedCollectionViewCell


        let index = indexPath.row

//        cell.dateLabel.text = "HELLO"
        
        // Do any custom modifications you your cell, referencing the outlets you defined in the Custom cell file.
//        print("HELLO WORLD: DATE:  \(deedsCompiler.getDeed(byIndex: index).getDate())")
        cell.dateLabel.text = formattedDate.string(from: deedsCompiler.getDeed(index: index).getDate())
        cell.descLabel.text = deedsCompiler.getDeed(index: index).desc

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "deedDetailsSegue", sender: self)
    }
    
    
    @IBAction func addClicked(_ sender: Any) {
        isDetailSegueAdd = true
        if question.questionIsEmpty() {
            performSegue(withIdentifier: "messageSegue", sender: self)
        } else {
            performSegue(withIdentifier: "deedDetailsSegue", sender: self)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier
        {
            if identifier == "deedDetailsSegue"
            {
                if isDetailSegueAdd {
                    isDetailSegueAdd = false
                } else {
                    if let indexPath = deedCollectionView.indexPathsForSelectedItems {
                        let index = indexPath[0].row
                        let selectedDeed = deedsCompiler.getDeed(index: index)
                        let destinationVC = segue.destination as! TaskDetailViewController
                        
                        destinationVC.currentDeed = selectedDeed
                        destinationVC.doesDeedExist = true
                    }
                }
            } else {
                let destinationVC = segue.destination as! MessageViewController
                
                destinationVC.titleStr = "YAY THERE IS NO MORE QUESTIONS TODAY"
            }
        }
        
        
    }
    
    
    

}

