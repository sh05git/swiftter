//
//  ViewController.swift
//  10egg
//
//  Created by 内田翔悟 on 2018/10/27.
//  Copyright © 2018 内田翔悟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countDown: UILabel!
    
    @IBOutlet var comment: UILabel!
    
    @IBOutlet var eggbreak: UIButton!
    
 var count: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        count -= 1
        countDown.text = String(count)
        
        if (count == 5){
            comment.text = "あと5回！！"
        }
        
        if (count == 0){
            countDown.text = "うんこ"
            eggbreak.isEnabled = false
            
        }
        
    }
    
}
