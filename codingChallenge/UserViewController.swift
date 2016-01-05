//
//  UserViewController.swift
//  codingChallenge
//
//  Created by shreshta bm on 1/5/16.
//  Copyright © 2016 shreshta bm. All rights reserved.
//

import UIKit
import MessageUI
var phoneno : String?
var mail : [String]?

class UserViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var headshot: UIImageView!
    
    @IBOutlet weak var fname: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.thesoloconnection.com/demo/")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        let bodyData = "method=get_user&id=1"
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
           
            if(data != nil)
            {
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
            print(json)
            let data = json!["data"] as! NSDictionary
            let name = data["fullname"] as! String
            let mail = data["email"] as! String
            phoneno = data["phone"] as? String
            let dp = data["profileimage"]as! Int
            
            self.headshot.image = UIImage(named: "headshot_"+String(dp))
            self.email.text = mail
            self.fname.text = name
            self.phone.text = phoneno
            self.reloadInputViews()
            }
        })
        task.resume()
        // Do any additional setup after loading the view.
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func phone(sender: AnyObject) {
        
        let url:NSURL = NSURL(string: "tel://"+phoneno!)!
        UIApplication.sharedApplication().openURL(url)
    }
    
    @IBAction func email(sender: AnyObject) {
        
       MFMailComposeViewController.canSendMail()
            let mailComposeVC = MFMailComposeViewController()
         
            mailComposeVC.setSubject("Hello")
            mailComposeVC.setMessageBody("hi", isHTML: true)
            mailComposeVC.setToRecipients(mail)
            
            presentViewController(mailComposeVC, animated:true, completion: nil)
    
    }
    
    

    @IBAction func back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
