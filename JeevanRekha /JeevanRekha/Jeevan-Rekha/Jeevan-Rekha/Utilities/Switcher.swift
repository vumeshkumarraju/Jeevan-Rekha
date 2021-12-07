//
//  Switcher.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 26/11/21.
//

import Foundation
import UIKit

class switcher {
    
    static func updateRootVC(){
        
        let status = UserDefaults.standard.bool(forKey: Constants.DefaultKeys.loginStatus) as! Bool
        var rootVC : UIViewController?
       
        print(status)
        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootvc")
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "startvc")
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    static func rootViewCOntrollerChanged(){
        var rootVC : UIViewController?
        
        rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rootvc")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}
