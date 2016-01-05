//
//  ViewController.swift
//  codingChallenge
//
//  Created by shreshta bm on 1/5/16.
//  Copyright © 2016 shreshta bm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func signin(sender: AnyObject) {
        
        if username.text == "shreshta" && password.text == "qwerty"
        {
            performSegueWithIdentifier("segue", sender: nil)
        }
        
        else
        {
            let alert = UIAlertController(title: "Invalid", message: "Wrong username/password", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            password.text = ""
  
        }
        
    }
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

