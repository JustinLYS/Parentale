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

class ViewController: UIViewController {
    
    var formattedDate = DateFormatter()
    var isDetailSegueAdd = false

    @IBOutlet weak var miniTitle: UILabel!
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var expTitle: UILabel!
    @IBOutlet weak var expSearch: UIButton!
    @IBOutlet weak var expAddLabel: UILabel!
    @IBOutlet weak var expAddBtn: UIButton!
    @IBOutlet weak var expImage: UIImageView!
    
    let maxHeaderHeight: CGFloat = 285
    let minHeaderHeight: CGFloat = 50
    
    var previousScrollOffset: CGFloat = 0;
    
    @IBOutlet weak var deedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = themeColor
        
        deedCollectionView.delegate = self
        deedCollectionView.dataSource = self
        formattedDate.dateFormat = "d MMM"
        
        let testDeed1 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed1)
        
        let testDeed2 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed2)
        let testDeed3 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed3)
        let testDeed4 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed4)
        let testDeed5 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed5)
        let testDeed6 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?")
        deedsCompiler.addDeed(newDeed: testDeed6)
        let testDeed7 = Deed(date: Date(), desc: "TESTING a very very long long question that might break code", question: "CAN I WORK?", image: UIImage.init(named: "branch")!)
        deedsCompiler.addDeed(newDeed: testDeed7)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.headerHeightConstraint.constant = self.maxHeaderHeight
        updateHeader()
    }
    
    
    func canAnimateHeader(_ scrollView: UIScrollView) -> Bool {
        // Calculate the size of the scrollView when header is collapsed
        let scrollViewMaxHeight = scrollView.frame.height + self.headerHeightConstraint.constant - minHeaderHeight
        
        // Make sure that when header is collapsed, there is still room to scroll
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
    func collapseHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.headerHeightConstraint.constant = self.minHeaderHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    func expandHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.headerHeightConstraint.constant = self.maxHeaderHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    func setScrollPosition(_ position: CGFloat) {
        self.deedCollectionView.contentOffset = CGPoint(x: self.deedCollectionView.contentOffset.x, y: position)
    }
    
    func updateHeader() {
        let range = self.maxHeaderHeight - self.minHeaderHeight
        let openAmount = self.headerHeightConstraint.constant - self.minHeaderHeight
        let percentage = openAmount / range
        
        self.titleTopConstraint.constant = -openAmount + 10
        self.expTitle.alpha = percentage
        self.expSearch.alpha = percentage
        self.expImage.alpha = percentage
        self.expAddLabel.alpha = percentage
        self.expAddBtn.alpha = percentage
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        deedCollectionView.reloadData()
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
                isDetailSegueAdd = false
                let destinationVC = segue.destination as! MessageViewController
                destinationVC.titleStr = "YAY THERE IS NO MORE QUESTIONS TODAY"
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deedsCompiler.size()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        if deedsCompiler.getDeed(index: index).hasImage() {
            let cell = deedCollectionView.dequeueReusableCell(withReuseIdentifier: "imageDeedCell", for: indexPath)
                as! ImageDeedCollectionViewCell
            
            cell.dateLabel.text = formattedDate.string(from: deedsCompiler.getDeed(index: index).getDate())
            cell.backImage.image = deedsCompiler.getDeed(index: index).getImage()
            
            return cell
        } else {
            let cell = deedCollectionView.dequeueReusableCell(withReuseIdentifier: "textDeedCell", for: indexPath)
                as! TextDeedCollectionViewCell
            
            cell.dateLabel.text = formattedDate.string(from: deedsCompiler.getDeed(index: index).getDate())
            cell.descLabel.text = deedsCompiler.getDeed(index: index).desc
            
            return cell
        }
        
        
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "deedDetailsSegue", sender: self)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        
        let absoluteTop: CGFloat = 0;
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;
        
        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
        
        if canAnimateHeader(scrollView) {
            
            // Calculate new header height
            var newHeight = self.headerHeightConstraint.constant
            if isScrollingDown {
                newHeight = max(self.minHeaderHeight, self.headerHeightConstraint.constant - abs(scrollDiff))
            } else if isScrollingUp {
                if (deedCollectionView.contentOffset.y < 0) {
                    newHeight = min(self.maxHeaderHeight, self.headerHeightConstraint.constant + abs(scrollDiff))
                }
            }
            
            // Header needs to animate
            if newHeight != self.headerHeightConstraint.constant {
                self.headerHeightConstraint.constant = newHeight
                self.updateHeader()
                self.setScrollPosition(self.previousScrollOffset)
            }
            
            self.previousScrollOffset = scrollView.contentOffset.y
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidStopScrolling()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.scrollViewDidStopScrolling()
        }
    }
    
    func scrollViewDidStopScrolling() {
        let range = self.maxHeaderHeight - self.minHeaderHeight
        let midPoint = self.minHeaderHeight + (range / 2)
        
        if self.headerHeightConstraint.constant > midPoint {
            self.expandHeader()
        } else {
            self.collapseHeader()
        }
    }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let index = indexPath.row
        
        if deedsCompiler.getDeed(index: index).hasImage() {
            return CGSize(width: 341, height: 110)
        } else {
            return CGSize(width: 341, height: 110)
        }
        
        
    }
}
