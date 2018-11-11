//
//  PreViewController.swift
//  cameraApp
//
//  Created by 内田翔悟 on 2018/10/28.
//  Copyright © 2018 内田翔悟. All rights reserved.
//

import UIKit

class PreViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         imageView.image = image

        // Do any additional setup after loading the view.
}
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveImage(_ sender: Any) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true, completion: nil)
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
