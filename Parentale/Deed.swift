//
//  Deed.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import Foundation
import UIKit

/*
 QUESTIONS FOR DESIGNR
 1) Can I have more than one deed per day (Occupy too much space)
 2) Can Image have Desc
 3) When I update Deed should I change the date?
 4) CAN I EVEN UPDATE A DEED OR JUST VIEW IT?
 5) IF they add too much word, main screen shows blah...?
 
 */
class Deed {
    
    // id is the combination of date (Day) and question
//    var id: String
    var date: Date
    var id: String
    var desc: String
    var question: String
    var image: UIImage?
    let formattedDate = DateFormatter()
    
    
    convenience init() {
        let currentDate = Date()
        let defaultDate = currentDate
        let defaultDesc = ""
        let defaultQuestion = ""
        self.init(date: defaultDate, desc: defaultDesc, question: defaultQuestion)
    }
    
    init(date: Date, desc: String, question: String, image: UIImage) {
        let currentDate = Date()
        self.date = currentDate
        self.desc = desc
        self.question = question
        self.image = image
        self.id = UUID().uuidString
    }
    
    init(date: Date, desc: String, question: String) {
        let currentDate = Date()
        self.date = currentDate
        self.desc = desc
        self.question = question
        image = nil
        self.id = UUID().uuidString
    }
    
//    func initID() -> Bool{
//        if let _ = self.date, let _ = self.question {
//            self.id = createId(date: date, question: question)
//            return true
//        } else {
//            return false
//        }
//    }
    
    func getDesc() -> String {
        return desc
    }
    
    func getQuestion() -> String {
        return question
    }
    
    func getImage() -> UIImage? {
        return image
    }
    
    func getDate() -> Date {
        return date
    }
    
    func setDesc(desc : String) {
        self.desc = desc
    }
    
    func setQuestion(question : String) {
        self.question = question
    }
    
    func setDate(date : Date) {
        self.date = date
    }
    
    func setImage(image : UIImage) {
        self.image = image
    }
    
    func getId() -> String {
        return id
    }
    
//    func getId() -> String {
//        if let verId = self.id {
//            return verId
//        }
//
//    }
    
    private func isBaseComplete() -> Bool {
        return true
//        if isValidDeedText() || isValidDeedImage() {
//            return true
//        } else {
//            return false
//        }
    }
    
//    func isValidDeedImage() -> Bool {
//        if let _ = id, let _ = image, let _ = date, let _ = desc, let _ = question {
//            return true
//        } else {
//            return false
//        }
//    }
    
//    func isValidDeedText() -> Bool {
//        if let _ = id, let _ = image, let _ = date, let _ = desc, let _ = question {
//            return false
//        } else if let _ = date, let _ = desc, let _ = question {
//            return true
//        } else {
//            return false
//        }
//    }

}
