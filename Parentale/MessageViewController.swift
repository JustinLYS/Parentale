//
//  MessageViewController.swift
//  Parentale
//
//  Created by Justin Lim on 2/7/19.
//  Copyright © 2019 Justin Lim. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    var titleStr: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        titleLabel.text = titleStr ?? "There is an error"
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
