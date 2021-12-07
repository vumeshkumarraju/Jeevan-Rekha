//
//  ProfileViewController.swift
//  Jeevan-Rekha
//
//  Created by V UMESH KUMAR RAJU on 04/12/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var Name: UILabel!
    @IBOutlet var profileaType: UILabel!
    @IBOutlet var phNo: UILabel!
    @IBOutlet var emailId: UILabel!
    @IBOutlet var IDType: UILabel!
    @IBOutlet var ID: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        profileImage.image = UIImage(named: "Abhisek Singh")
        Name.text = UserDefaults.standard.value(forKey: Constants.DefaultKeys.name) as? String
        let profileType = UserDefaults.standard.value(forKey: Constants.DefaultKeys.type) as? String
        profileaType.text = profileType
        phNo.text = UserDefaults.standard.value(forKey: Constants.DefaultKeys.phno) as? String
        emailId.text = UserDefaults.standard.value(forKey: Constants.DefaultKeys.mail) as? String
        if profileType == "Doctor"{
            IDType.text = "Doctor ID : "
        }
        else if profileType == "Staff"{
            IDType.text = "Staff ID : "
        }else{
            IDType.text = "Patient ID : "
        }
        ID.text = UserDefaults.standard.value(forKey: Constants.DefaultKeys.id) as? String
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
   }
    
    @IBAction func logOut(_ sender: Any) {
        remove()
        switcher.updateRootVC()
        if self.presentingViewController != nil {
            self.dismiss(animated: false, completion: {
               self.navigationController!.popToRootViewController(animated: true)
            })
        }
        else {
            self.navigationController!.popToRootViewController(animated: true)
        }
    }
    func remove(){
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.mail)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.password)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.name)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.phno)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.id)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.type)
        UserDefaults.standard.set(false,forKey: Constants.DefaultKeys.loginStatus)
    }
}
