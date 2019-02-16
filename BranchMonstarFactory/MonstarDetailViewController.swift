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
    @IBOutlet weak var largeMonstarImageView: UIImageView!
    @IBOutlet weak var branchLinkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("what is the largeMonstarImageName", largeMonstarImageName)
        largeMonstarImageView.image = UIImage(named: largeMonstarImageName)
        branchLinkLabel.text = "BRANCH LINK!"

        // Do any additional setup after loading the view.
    }
    
    

}
