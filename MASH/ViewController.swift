//
//  ViewController.swift
//  MASH
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    // Labels
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!

    @IBOutlet weak var mashM: UILabel!
    @IBOutlet weak var mashA: UILabel!
    @IBOutlet weak var mashS: UILabel!
    @IBOutlet weak var mashH: UILabel!
   
    // Text fields
    @IBOutlet weak var rInputOne: UITextField!
    @IBOutlet weak var rInputTwo: UITextField!
    @IBOutlet weak var rInputThree: UITextField!
    @IBOutlet weak var rInputFour: UITextField!
    
    @IBOutlet weak var bInputOne: UITextField!
    @IBOutlet weak var bInputTwo: UITextField!
    @IBOutlet weak var bInputThree: UITextField!
    @IBOutlet weak var bInputFour: UITextField!
    
    @IBOutlet weak var lInputOne: UITextField!
    @IBOutlet weak var lInputTwo: UITextField!
    @IBOutlet weak var lInputThree: UITextField!
    @IBOutlet weak var lInputFour: UITextField!
    
    // Magic number
    @IBOutlet weak var magicNumBtn: UIButton!
    var magicNum: Int = 0
    var findingMagicNum: Bool = false

    let dot : UIView = UIView()
    var timer: NSTimer?

    
    // METHODS //
    
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
    
    // Traditional mode
    func changeLabels() {
        self.rightLabel.text = "Cars"
        self.bottomLabel.text = "Kids"
        self.leftLabel.text = "Crushes"
    }
    
    
    // Magic Number functionality
    
    @IBAction func didStartRandomizeMagicNum(sender: AnyObject) {
        createTimerForRandomNum()
    }

    @IBAction func stopRandomizeMagicNum(sender: AnyObject) {
        self.timer?.invalidate()
        highlightStartingPosition()
    }
    
    func createTimerForRandomNum() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "setRandomNumber", userInfo: nil, repeats: true)
    }
    
    func setRandomNumber() {
        magicNum = Int(arc4random_uniform(8)) + 1
        self.magicNumBtn.setTitle(String(magicNum), forState: .Normal)
    }
    
    
    func highlightStartingPosition() {
        mashM.layer.borderColor = UIColor.blueColor().CGColor
        mashM.layer.borderWidth = 2.0
    }

    

}

