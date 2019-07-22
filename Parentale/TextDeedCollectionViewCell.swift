//
//  TextDeedCollectionViewCell.swift
//  Parentale
//
//  Created by Justin Lim on 3/7/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class TextDeedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 35.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
    }
}
