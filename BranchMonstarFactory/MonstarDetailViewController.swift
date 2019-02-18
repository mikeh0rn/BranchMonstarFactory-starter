//
//  MonstarDetailViewController.swift
//  BranchMonstarFactory
//
//  Created by Michael Horn on 2/15/19.
//  Copyright © 2019 Mike Horn. All rights reserved.
//

import UIKit

class MonstarDetailViewController: UIViewController {

    var largeMonstarImageName = ""
    var monstarUrl = ""
    
    @IBOutlet weak var largeMonstarImageView: UIImageView!
    @IBOutlet weak var branchLinkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        largeMonstarImageView.image = UIImage(named: largeMonstarImageName)
        branchLinkLabel.text = monstarUrl
        
        
    }
    
    

}
