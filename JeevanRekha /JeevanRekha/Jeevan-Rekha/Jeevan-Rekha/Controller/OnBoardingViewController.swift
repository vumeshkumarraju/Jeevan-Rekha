//
//  OnBoardingViewController.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 06/11/21.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 8
        signInButton.layer.cornerRadius = 8
        logInButton.clipsToBounds = true
        signInButton.clipsToBounds = true
    }
    

}
