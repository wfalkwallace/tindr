//
//  ProfileViewController.swift
//  tindr
//
//  Created by William Falk-Wallace on 3/3/15.
//  Copyright (c) 2015 Falk-Wallace Software. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    var profileImageToSet: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = profileImageToSet
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            return
        })
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
