//
//  DashboardViewController.swift
//  codingChallenge
//
//  Created by shreshta bm on 1/5/16.
//  Copyright © 2016 shreshta bm. All rights reserved.
//

import UIKit
public var users : [User] = [User]()
var number : Int = 0
var arrowdir : Int = 0;
class DashboardViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var notNumber: UILabel!
   
    @IBOutlet weak var search: UISearchBar!
    
   
     @IBOutlet weak var seg: UISegmentedControl!
 
    @IBOutlet weak var extra: UISwitch!
    
    @IBAction func switchextra(sender: AnyObject) {
       
        users.removeAll()
        number = 0
        if extra.on
        {
            search.hidden = false
        }
        else
        {
            search.hidden = true
        }
        
         jsoncall()
        
    }
    
    @IBAction func RtoS(sender: AnyObject) {
        
        switch seg.selectedSegmentIndex
       
        {
          
        case 0:
            arrowdir = 0
        case 1:
            arrowdir = 1
        default:
            break; 
        }
       
        table.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search.hidden = true
      
        //users.append(user)
         _ = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "update", userInfo: nil, repeats: true)
        
        jsoncall()
       
  
    }

    override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UsetTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UsetTableViewCell
        
        let arr = users[indexPath.row]
        
        cell.setcell(arr.custname, amount: arr.amount, uphone: arr.userphoneno, uname: arr.username, uimage: "headshot_"+arr.userimage, cphone: arr.custphoneno)
        
        return cell
        
    }
    
    @IBAction func notification(sender: AnyObject) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.thesoloconnection.com/demo/")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
   
       let bodyData = "method=dashboard"
        
        
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
      
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        
              if(data != nil)
              {
                
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
                //print(json)
                let not = json!["notifications"] as! Int
                //print(not)
            //usleep(1)
            self.notNumber.text = String(not)
            self.notNumber.reloadInputViews()
        } })
        task.resume()
    }

    @IBAction func alertA(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Success", message: "You pressed button A", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
       
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func alertB(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Success", message: "You pressed button b You pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button bYou pressed button b             You pressed ", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "NO", style: UIAlertActionStyle.Default, handler: nil))
       
        self.presentViewController(alert, animated: true, completion: nil)
    }

    func update()
    {
        table.reloadData()
    }
    
    func jsoncall()
    {
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.thesoloconnection.com/demo/")!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        
        var bodyData = "method=search"
        if extra.on
        {
            bodyData = "method=search&filter="+search.text!
        }
        request.HTTPBody = bodyData.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            if(data != nil)
            {  let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! NSDictionary
                //print(json)
                
                let data = json["data"] as! NSArray
                
                //  print(data)
                
                number = data.count-1
                for index in 0...number
                {
                    if let single = data[index] as? NSDictionary {
                        
                        let cname = single["customer_name"] as! String
                        let cphone = single["customer_phone"] as? String
                        let uname = single["fullname"] as? String
                        let uphone = single["phone"] as? String
                        let dp = single["profileimage"] as! Int
                        let amount = single["amount"] as! String
                        let user = User(name: cname, image: String(dp), uph: uphone!, uname: uname!, cph: cphone!, amt: "$ "+amount)
                        users.append(user)
                        
                    }
                }
            }
            print(users)
        })
        task.resume()
        table.reloadData()
    }
}
