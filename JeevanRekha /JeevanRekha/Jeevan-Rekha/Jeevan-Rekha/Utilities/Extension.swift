//
//  Extension.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 07/11/21.
//

import Foundation
import UIKit


extension UIViewController{
    public func showPopUp(title:String,message:String){

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}

extension UITextField {

    func setLeftPadding(_ amount: CGFloat = 10) {

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.bounds.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
