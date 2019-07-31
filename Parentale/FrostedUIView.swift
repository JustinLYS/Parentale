//
//  FrostedUIView.swift
//  Parentale
//
//  Created by Justin Lim on 24/7/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class FrostedUIView: UIView {

    override func awakeFromNib() {
        self.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])

    }
}
