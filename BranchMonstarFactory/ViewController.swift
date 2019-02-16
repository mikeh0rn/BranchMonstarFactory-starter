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

    private let buo = BranchUniversalObject.init(canonicalIdentifier: "content/12345")
    private let lp: BranchLinkProperties = BranchLinkProperties()
    private var largeMonstarImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let buo = BranchUniversalObject.init(canonicalIdentifier: "content/12345")
        buo.title = "My Content Title"
        buo.contentDescription = "My Content Description"
        buo.imageUrl = "https://lorempixel.com/400/400"
        buo.publiclyIndex = true
        buo.locallyIndex = true
        buo.contentMetadata.customMetadata["key1"] = "value1"
    }

    func setlinkparams(){
        let lp: BranchLinkProperties = BranchLinkProperties()
        lp.channel = "facebook"
        lp.feature = "sharing"
        lp.campaign = "content 123 launch"
        lp.stage = "new user"
        lp.tags = ["one", "two", "three"]
        
        lp.addControlParam("$desktop_url", withValue: "http://example.com/desktop")
        lp.addControlParam("$ios_url", withValue: "http://example.com/ios")
        lp.addControlParam("$ipad_url", withValue: "http://example.com/ios")
        lp.addControlParam("$android_url", withValue: "http://example.com/android")
        lp.addControlParam("$match_duration", withValue: "2000")
        
        lp.addControlParam("custom_data", withValue: "yes")
        lp.addControlParam("look_at", withValue: "this")
        lp.addControlParam("nav_to", withValue: "over here")
        lp.addControlParam("random", withValue: UUID.init().uuidString)
    }
    
    @IBAction func selectMonstar(sender: UIButton) {
        largeMonstarImageName = String(sender.tag)
        //TODO: don't perform segue until buo.getShortUrl is created
        performSegue(withIdentifier: "segueToMonstarDetailViewController", sender: nil)
    }
    
    func createShortUrl() {
        buo.getShortUrl(with: lp) { (url, error) in
//            TODO: GENERATE SHORT LINK AND THEN WHEN GENERATED, PERFORM SEGUE TO NEXT VIEW
            print(url ?? "")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let monstarDetailViewController = segue.destination as! MonstarDetailViewController
        monstarDetailViewController.largeMonstarImageName = largeMonstarImageName
    }

}

