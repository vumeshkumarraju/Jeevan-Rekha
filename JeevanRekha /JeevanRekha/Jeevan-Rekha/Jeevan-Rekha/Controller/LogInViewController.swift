//
//  LogInViewController.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 06/11/21.
//

import UIKit
import FirebaseAuth
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    @IBOutlet var ForgetPassButton: UIButton!
    var x : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        emailTextField.layer.cornerRadius = 8
        PasswordTextField.layer.cornerRadius = 8
        emailTextField.clipsToBounds = true
        PasswordTextField.clipsToBounds = true
        loginButton.clipsToBounds = true
        emailTextField.setLeftPadding()
        PasswordTextField.setLeftPadding()
        show()
    }
    
    var users = [user]()
    func validateEntry()->String{
        
        let userEmail = emailTextField.text
        let userPassword = PasswordTextField.text
        
        
        if (  userPassword!.isEmpty || userEmail!.isEmpty  ){
            return("Empty Textfield")
        }
        if !(userEmail?.contains("@") ?? true){
            return("Invalid E-Mail ID")
        }
        
        if userPassword?.count ?? 9 < 7{
            return("Invalid Password")
        }
        return("No Issues")
        
    }

    @IBAction func LogIn(_ sender: Any) {
        let message = validateEntry()
        if message != "No Issues"{
        showPopUp(title: "", message: message)
        }else{
            UserDefaults.standard.set(emailTextField.text, forKey: Constants.DefaultKeys.mail)
            UserDefaults.standard.set(PasswordTextField.text,forKey: Constants.DefaultKeys.password)
            Auth.auth().signIn(withEmail: emailTextField.text!, password: PasswordTextField.text!) { (result, error) in
                if error != nil{
                    self.showPopUp(title: "", message: error!.localizedDescription)
                }
                else{
                    self.getData(checkID: result!.user.uid)
                    switcher.rootViewCOntrollerChanged()
                    if self.presentingViewController != nil {
                        self.dismiss(animated: false, completion: {
                           self.navigationController!.popToRootViewController(animated: true)
                        })
                    }
                    else {
                        self.navigationController!.popToRootViewController(animated: true)
                    }
                }
            }
        }
            
    }
    func getData(checkID : String){
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { snapshot, error in
            if error == nil{
                DispatchQueue.main.async {
                    print(snapshot?.documents.count)
                    for d in snapshot?.documents ?? []{
                        if d["uid"] as! String == checkID{
                            UserDefaults.standard.set(true,forKey: Constants.DefaultKeys.loginStatus)
                            UserDefaults.standard.set(d["name"], forKey: Constants.DefaultKeys.name)
                            UserDefaults.standard.set(d["type"],forKey: Constants.DefaultKeys.type)
                            UserDefaults.standard.set(d["phoneNo"],forKey: Constants.DefaultKeys.phno)
                            UserDefaults.standard.set(d["ID"],forKey: Constants.DefaultKeys.id)
                        }
                        else{
                            UserDefaults.standard.set(false,forKey: Constants.DefaultKeys.loginStatus)
                            self.showPopUp(title: "User id Not found", message: "Enter correct credential")
                        }
                    }
                }
                
            }
        }
    }
    func show(){
        if self.x == 1{
        self.showPopUp(title: "Email Verification", message: "Your credentials will be verified and will be linked with your ID.")
            self.x = 0
        }
    }
}
