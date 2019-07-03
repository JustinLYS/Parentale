//
//  OneSecondUITextField.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

@IBDesignable
class OneSecondUITextField: UITextField {

    @IBInspectable var delayValue : Double = 1.0
    var timer:Timer?
    
    var actionClosure : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(changedTextFieldValue), for: .editingChanged)
    }
    
    @objc func changedTextFieldValue(){
        timer?.invalidate()
        //setup timer
        timer = Timer.scheduledTimer(timeInterval: delayValue, target: self, selector: #selector(self.executeAction), userInfo: nil, repeats: false)
    }
    
    @objc func executeAction(){
        actionClosure?()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */


}
