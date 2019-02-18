//
//  ViewController.swift
//  BranchMonstarFactory
//
//  Created by Michael Horn on 2/13/19.
//  Copyright © 2019 Mike Horn. All rights reserved.
//

import UIKit
import Branch

class ViewController: UIViewController {

    private var largeMonstarImageName = ""
    private var monstarUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buo = BranchUniversalObject.init(canonicalIdentifier: "monstar/\(UUID.init().uuidString)")
        buo.title = "Monstar"
        buo.contentDescription = "Monstars steal NBA player talents"
        buo.contentMetadata.customMetadata["movie"] = "space jam"
    }
    
    @IBAction func selectMonstar(sender: UIButton) {
        largeMonstarImageName = String(sender.tag)
        createShortUrl()
    }
    
    func createShortUrl() {
        let buo = BranchUniversalObject.init(canonicalIdentifier: "monstar/\(UUID.init().uuidString)")
        buo.title = "Monstar"
        buo.contentDescription = "Monstars steal NBA player talents"
        buo.contentMetadata.customMetadata["movie"] = "space jam"
        
        let lp: BranchLinkProperties = BranchLinkProperties()
        lp.channel = "facebook"
        lp.feature = "sharing"
        lp.campaign = "space jam marketing campaign"
        lp.tags = ["michael_jordan", "bugs_bunny", "lola_bunny"]
        lp.addControlParam("monstar_id", withValue: UUID.init().uuidString)
        
        buo.getShortUrl(with: lp) { (url, error) in

            print(url ?? "")
            if let unwrappedUrl = url {
                self.monstarUrl = unwrappedUrl
            }
            
            self.performSegue(withIdentifier: "segueToMonstarDetailViewController", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let monstarDetailViewController = segue.destination as! MonstarDetailViewController
        monstarDetailViewController.largeMonstarImageName = largeMonstarImageName
        monstarDetailViewController.monstarUrl = monstarUrl
    }

}

