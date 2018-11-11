//
//  LoginViewController.swift
//  ChatApp
//
//  Created by 内田翔悟 on 2018/11/04.
//  Copyright © 2018 内田翔悟. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        
        //最後に、認証情報を使用して Firebase での認証を行います
        Auth.auth().signInAndRetrieveData(with: credential) { (authDataResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("\nLogin successful\n")
            self.transitionToChatRoom()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    func transitionToChatRoom() {
        performSegue(withIdentifier: "toChatRoom", sender: self)
    }
    
    @IBAction func tappedSignOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("SignOut is successed")
            reloadInputViews()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
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
