//
//  ModeViewController.swift
//  MASH
//
//  Created by Kyna Nguyen on 11/9/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import UIKit

class ModeViewController: UIViewController {
    
    @IBOutlet weak var developerMode: UIButton!
    
    @IBOutlet weak var traditionalMode: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.hidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "traditionalModeButton" {
            let modeController = segue.destinationViewController as! GameViewController
//            modeController.changeLabels()
        }
    }

}
