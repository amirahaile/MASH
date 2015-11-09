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
    
    func dot() {
        let dot : UIView = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.backgroundColor = UIColor.blackColor()
        self.view.addSubview(dot)
        self.view.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:[dot(==50)]", options: .DirectionLeftToRight, metrics: nil, views: ["dot" : dot])
        )
        self.view.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:[dot(==50)]", options: .DirectionLeftToRight, metrics: nil, views: ["dot" : dot])
        )
        self.view.addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:[lInputOne]-[dot(==50)]", options: .DirectionLeftToRight, metrics: nil, views: ["dot" : dot, "lInputOne" : lInputOne])
        )
        self.view.addConstraint( NSLayoutConstraint.init(item: dot, attribute: .CenterY, relatedBy: .Equal, toItem: lInputOne, attribute: .CenterY, multiplier: 1, constant: 0))
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lInputOne.delegate = self
        dot()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        debugPrint(textField.text)
    }
    
    func changeLabels() {
        self.languages.text = "Crushes"
    }

}

