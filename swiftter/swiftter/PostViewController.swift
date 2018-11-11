//
//  PostViewController.swift
//  swiftter
//
//  Created by 内田翔悟 on 2018/11/11.
//  Copyright © 2018 内田翔悟. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class PostViewController: UIViewController {

    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var displayName = String()
    var pictureURLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    displayName = UserDefaults.standard.object(forKey: "displayName")
        as! String
    pictureURLString = UserDefaults.standard.object(forKey: "pictureURLString")
            as! String
        
        nameLabel.text = displayName
        profileImageView.sd_setImage(with: URL(string: pictureURLString), completed: nil)
        
        profileImageView.layer.cornerRadius = 8.0
        profileImageView.clipsToBounds = true
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func post(_ sender: Any) {
        
        let rootRef = Database.database().reference(fromURL: "https://swiftter01.firebaseio.com/").child("post").childByAutoId()
        
        let feed = ["comment": textField.text,"userName": nameLabel.text] as [String: Any]
        rootRef.setValue(feed)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        // 共有する項目
        let shareText = "暇してる人集まれー"
        let shareWebsite = NSURL(string: "https://ucblogbu.com/")!
        
        
        let activityItems = [shareText, shareWebsite] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.print
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

