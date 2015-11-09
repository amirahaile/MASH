//
//  ViewController.swift
//  MASH
//
//  Created by Amira Hailemariam on 11/5/15.
//  Copyright © 2015 Amira Hailemariam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//      WHERE DOES THIS GO?!?!?!?
//    let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
//    
//    request.setValue(token, forHTTPHeaderField: "Authorization");
    let MyKeychainWrapper = KeychainWrapper()
    let createLoginButtonTag = 0
    let loginButtonTag = 1
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestInstagramAccess() {
        let authURL = NSURL(string: "https://api.instagram.com/oauth/authorize/?client_id=\(CLIENT-ID)&redirect_uri=\(REDIRECT-URI)&response_type=code")
        UIApplication.sharedApplication().openURL(authURL!)
    }
    
    func exchangeCodeInURL(codeURL : NSURL) {
        if let code = codeURL.query {
            let request = NSMutableURLRequest(URL: NSURL(string: "https://github.com/login/oauth/access_token?\(code)&client_id=\(kClientId)&client_secret=\(kClientSecret)")!)
            request.HTTPMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
                if let httpResponse = response as? NSHTTPURLResponse {
                    var jsonError: NSError?
                    if let rootObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String : AnyObject], token = rootObject["access_token"] as? String {
                        //Save and handle the token
                    }
                }
            }).resume()
        }
    }
    
    

    @IBAction func oauthInstagram() {
    }
}

