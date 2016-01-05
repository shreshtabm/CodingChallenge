//
//  class.swift
//  codingChallenge
//
//  Created by shreshta bm on 1/5/16.
//  Copyright © 2016 shreshta bm. All rights reserved.
//

import Foundation


public class User {
    
 
    var custname = ""
    
    var userimage  = "blank"
    
    var userphoneno  = ""
    
    var username  = ""
    
    var custphoneno = ""
    
    var amount = ""
    
    init(name : String, image : String , uph : String, uname : String, cph: String, amt : String)
        
    {
        self.custname = name
        
        self.userimage = image
        
        self.userphoneno = uph
        
        self.username = uname
        
        self.custphoneno = cph
        
        self.amount = amt
    }
    
}