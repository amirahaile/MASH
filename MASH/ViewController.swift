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
    

    // Elements Array
    var elements = [UIView]()
    var categories = [String: Array<UIView>]()
    
    // Magic number
    @IBOutlet weak var magicNumBtn: UIButton!
    var magicNum: Int = 0
    var findingMagicNum: Bool = false

    var timer: NSTimer?
    var highlightTimer: NSTimer?
    var currentElement: UIView?
    var previousElement: UIView?
    var indexCount: Int = 0
    var rotationCount: Int = 0
    
    // METHODS //

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createInputArray()
        self.createInputDictionary()
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
        createTimerForHighlighting()
    }
    
    func createTimerForRandomNum() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "setRandomNumber", userInfo: nil, repeats: true)
    }
    
    func setRandomNumber() {
        magicNum = Int(arc4random_uniform(8)) + 1
        self.magicNumBtn.setTitle(String(magicNum), forState: .Normal)
    }
    
    
    func highlightElement(element : UIView) {
        element.layer.borderColor = UIColor.blueColor().CGColor
        element.layer.borderWidth = 2.0

    }
    
    func unhighlightElement(element : UIView) {
        element.layer.borderWidth = 0.0
    }
    
    func highlightWinningElement(element: UIView) {
        element.layer.borderColor = UIColor.greenColor().CGColor
        element.layer.borderWidth = 5.0
    }
    
    func createInputArray() {
        self.elements = [mashM, mashA, mashS, mashH, rInputOne, rInputTwo, rInputThree, rInputFour, bInputOne, bInputTwo, bInputThree, bInputFour, lInputFour, lInputThree, lInputTwo, lInputOne]
    }
    
    func createInputDictionary() {
        self.categories = ["mash": [mashM, mashA, mashS, mashH], "right": [rInputOne, rInputTwo, rInputThree, rInputFour], "bottom": [bInputOne, bInputTwo, bInputThree, bInputFour], "left": [lInputFour, lInputThree, lInputTwo, lInputOne]]
    }
    
    func createTimerForHighlighting() {
        highlightTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "highlightCount", userInfo: nil, repeats: true)
    }
    
    func deleteElementFromDictionary(element: UIView){
        // delete to keep dictionary updated and check to make sure each category has 1 element
        for (category, uiViewElements) in categories {
            // if only 1 element, remove key/value pair from dictionary and highlight last element
            if uiViewElements.contains(element) && uiViewElements.count >= 1 {
                let index = uiViewElements.indexOf(element)
                var newArray = uiViewElements
                if newArray.count == 1 {
                    highlightWinningElement(element)
                    categories[category] = nil
                } else {
                    newArray.removeAtIndex(index!)
                    categories[category] = newArray
                }
            }
        }
    }
    
    func isGameOver()->Bool {
        if categories.isEmpty {
            highlightTimer?.invalidate()
            return true
        } else {
            return false
        }
    }
    
    func highlightCount() {
        if isGameOver() {return}
        if indexCount == self.elements.count { indexCount = 0 }
        currentElement = self.elements[indexCount]
        highlightElement(currentElement!)
        if previousElement != nil && self.elements.contains(previousElement!) {
            unhighlightElement(previousElement!)
        }
        previousElement = currentElement
        if rotationCount == magicNum - 1 {
            highlightTimer?.invalidate()
            crossOutElement(currentElement!)
            deleteElementFromDictionary(currentElement!)
            rotationCount = 0
            indexCount--
            createTimerForHighlighting()
        } else {
            rotationCount++
        }
         indexCount++
    }
    
    func crossOutElement(element: UIView) {
        let elementIndex = self.elements.indexOf(element)
        if element is UILabel {
            element.layer.backgroundColor = UIColor.grayColor().CGColor
        } else if element is UITextField {
            element.layer.borderColor = UIColor.grayColor().CGColor
        }
        self.elements.removeAtIndex(elementIndex!)
    }
    
    func resetGameState() {
        createInputArray()
        createInputDictionary()
    }
    
    @IBAction func restartGame(sender: AnyObject) {
        resetGameState()
        self.magicNumBtn.setTitle("Magic Number", forState: .Normal)
        self.highlightTimer?.invalidate()
        self.timer?.invalidate()
        for element in self.elements {
            if element is UITextField {
                (element as! UITextField).text = ""
                unhighlightElement(element)
            }
        }
    }

}

