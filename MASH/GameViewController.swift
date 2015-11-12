//
//  ViewController.swift
//  MASH
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
   
    // Labels
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!

    
    // Text fields
    @IBOutlet weak var rInputOne: UITextField!
    @IBOutlet weak var rInputTwo: UITextField!
    @IBOutlet weak var rInputThree: UITextField!
    @IBOutlet weak var rInputFour: UITextField!
    
    @IBOutlet weak var lInputOne: UITextField!
    @IBOutlet weak var lInputTwo: UITextField!
    @IBOutlet weak var lInputThree: UITextField!
    @IBOutlet weak var lInputFour: UITextField!
    
    
    @IBOutlet weak var bInputOne: UITextField!
    @IBOutlet weak var bInputTwo: UITextField!
    @IBOutlet weak var bInputThree: UITextField!
    @IBOutlet weak var bInputFour: UITextField!

    // Magic number
    @IBOutlet weak var magicNum: UIButton!
    

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

    }

    
    func textFieldDidEndEditing(textField: UITextField) {
        debugPrint(textField.text)
    }
    
    
    @IBAction func magicNum(sender: AnyObject) {
        UIView.animateWithDuration(1.0, animations: {
            self.dot.frame = CGRect(x: self.lInputTwo.frame.origin.x + (self.lInputTwo.frame.width + 10), y: self.lInputTwo.frame.origin.y, width: 25, height: 25)
        })

        UIView.animateWithDuration(1.0, animations: {
            self.dot.frame = CGRect(x: self.lInputThree.frame.origin.x + (self.lInputThree.frame.width + 10), y: self.lInputThree.frame.origin.y, width: 25, height: 25)
        })

        
//        COMBINE LIST OF ANIMATIONS - DON'T KNOW HOW TO FIX ERRORS
//        UIView.animateWithDuration(1.0, delay: 0.2, options: UIViewAnimationOptions .TransitionNone, animations: {
//            [UIView .addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: {     self.dot.frame = CGRect(x: self.lInputTwo.frame.origin.x + (self.lInputTwo.frame.width + 10), y: self.lInputTwo.frame.origin.y, width: 25, height: 25)
//            })];
//            [UIView .addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: {     self.dot.frame = CGRect(x: self.lInputThree.frame.origin.x + (self.lInputThree.frame.width + 10), y: self.lInputThree.frame.origin.y, width: 25, height: 25)
//            })]
//        }, completion: ((true)->void))
        
        
//        FAILS TO CREATE PATH
//        var myPath:CGMutablePath = CGPathCreateMutable()
//        CGPathMoveToPoint(myPath, nil, self.lInputTwo.frame.origin.x + (self.lInputTwo.frame.width + 10), self.lInputTwo.frame.origin.y)
//
//        CGPathAddLineToPoint(myPath, nil, self.lInputTwo.frame.origin.x, self.lInputTwo.frame.origin.y)

    }
    

    

}

