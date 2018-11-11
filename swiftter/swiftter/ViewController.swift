//
//  ViewController.swift
//  swiftter
//
//  Created by 内田翔悟 on 2018/11/11.
//  Copyright © 2018 内田翔悟. All rights reserved.
//

import UIKit
import LineSDK

class ViewController: UIViewController, LineSDKLoginDelegate {
    
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LineSDKLogin.sharedInstance().delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        
        if let displayName = profile?.displayName {
            self.displayName = displayName
        }
        
        if let pictureURL = profile?.pictureURL {
            self.pictureURLString = pictureURL.absoluteString
        }
        
        UserDefaults.standard.set(self.displayName, forKey: "displayName")
        UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        
        LineSDKLogin.sharedInstance().start()
        
        
    }
    
}

