//
//  ViewController.swift
//  MASH
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var languages: UILabel!
    
    @IBOutlet weak var lInputOne: UITextField!
    
    @IBOutlet weak var lInputTwo: UITextField!
    
    @IBOutlet weak var lInputThree: UITextField!

    @IBOutlet weak var lInputFour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func changeLabels() {
        self.languages.text = "Crushes"
    }

}

