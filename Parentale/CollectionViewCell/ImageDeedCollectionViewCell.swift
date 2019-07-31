//
//  ImageDeedCollectionViewCell.swift
//  Parentale
//
//  Created by Justin Lim on 31/7/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class ImageDeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var frostedDateView: FrostedUIView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 35
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
        
        backImage.contentMode = .scaleAspectFill
        
        frostedDateView.layer.cornerRadius = 25
        frostedDateView.clipsToBounds = true
    }
}
