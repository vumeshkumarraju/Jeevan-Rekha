//
//  Model.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 24/11/21.
//

import Foundation

enum pStatus{
    case crtical
    case moderate
    case fine
}

struct patient{
    var name : String
    var pID : String
    var disease : String
    var status : pStatus
    var age : Int
}

struct user{
    var ID : String
    var type : String
    var name : String
    var phoneNo : String
    var uid : String
}


