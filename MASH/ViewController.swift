//
//  ViewController.swift
//  MASH
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    
    @IBOutlet weak var languages: UILabel!
    
    @IBOutlet weak var lInputOne: UITextField!
    
    @IBOutlet weak var lInputTwo: UITextField!
    
    @IBOutlet weak var lInputThree: UITextField!

    @IBOutlet weak var lInputFour: UITextField!

    let dot : UIView = UIView()

    
    func configDot() {
        self.dot.translatesAutoresizingMaskIntoConstraints = false
        self.dot.backgroundColor = UIColor.blackColor()
        self.view.addSubview(dot)
        self.view.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[dot(==25)]", options: .DirectionLeftToRight, metrics: nil, views: ["dot" : self.dot])
        )
        self.view.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:[lInputOne]-[dot(==25)]", options: .DirectionLeftToRight, metrics: nil, views: ["dot" : self.dot, "lInputOne" : self.lInputOne])
        )
        self.view.addConstraint( NSLayoutConstraint.init(item: dot, attribute: .CenterY, relatedBy: .Equal, toItem: self.lInputOne, attribute: .CenterY, multiplier: 1, constant: 0))
    
    }
    
    override func viewDidLayoutSubviews() {
        self.dot.layer.cornerRadius = self.dot.bounds.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lInputOne.delegate = self
        configDot()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        debugPrint(textField.text)
    }
    
    func changeLabels() {
        self.languages.text = "Crushes"
    }

}

