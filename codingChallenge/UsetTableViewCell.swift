//
//  UsetTableViewCell.swift
//  codingChallenge
//
//  Created by shreshta bm on 1/5/16.
//  Copyright © 2016 shreshta bm. All rights reserved.
//

import UIKit

class UsetTableViewCell: UITableViewCell {

    @IBOutlet weak var custname: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var userphoneno: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var custphoneno: UILabel!
    @IBOutlet weak var arrdir: UIImageView!
    override func awakeFromNib() {
        
       
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setcell (cname : String, amount : String , uphone : String ,uname : String, uimage : String, cphone : String)
    {
        self.custname.text = cname
        self.amount.text = amount
        self.userphoneno.text = uphone
        self.username.text = uname
        self.userimage.image = UIImage(named: uimage)
        self.custphoneno.text = cphone
        if(arrowdir == 0)
        {
            arrdir.image = UIImage(named: "left")
        }
        else
        {
            arrdir.image = UIImage(named: "arrow-right")
        }
    }

}
