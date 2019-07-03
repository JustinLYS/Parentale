//
//  DeedTextTableViewCell.swift
//  Parentale
//
//  Created by Justin Lim on 24/6/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class DeedTextTableViewCell: UITableViewCell {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backLabel.clipsToBounds = true
        backLabel.layer.cornerRadius = 35
        backLabel.layer.backgroundColor = UIColor.white.cgColor
        
        backLabel.layer.shadowColor = UIColor.red.cgColor
        backLabel.layer.shadowOpacity = 1
        backLabel.layer.shadowRadius = 10
//        backLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        backLabel.layer.shadowOffset = .zero
        backLabel.layer.shadowPath = UIBezierPath(rect: backLabel.bounds).cgPath
        backLabel.layer.shouldRasterize = true
        backLabel.layer.rasterizationScale = UIScreen.main.scale
        backLabel.addShadow()
        
        
        descLabel.clipsToBounds = true
        
        dateLabel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        backLabel.clipsToBounds = true
        backLabel.layer.backgroundColor = UIColor.white.cgColor
    }

    
}

extension UIView {
    func addShadow(){
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 20.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
