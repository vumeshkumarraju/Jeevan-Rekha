//
//  UserTypeViewController.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 06/11/21.
//

import UIKit
import FirebaseAuth
import Firebase


class UserTypeViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet var UserPicker: UIPickerView!
    @IBOutlet var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserPicker.delegate = self
        UserPicker.dataSource = self
        signInButton.layer.cornerRadius = 8
        signInButton.clipsToBounds = true
    }
    
    let Usertype : [String] = ["Doctor","Staff","Family"]
    var selectUser : String = "Doctor"
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Usertype.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Usertype[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectUser = Usertype[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 280, height: 190))
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Poppins", size: 36)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = Usertype[row]
        pickerLabel?.textColor = UIColor.white
        return pickerLabel!
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    
    @IBAction func CAA(_ sender: Any) {
        
        UserDefaults.standard.set(selectUser, forKey: Constants.DefaultKeys.type)
        
        Auth.auth().createUser(withEmail: UserDefaults.standard.value(forKey: Constants.DefaultKeys.mail) as! String, password: UserDefaults.standard.value(forKey: Constants.DefaultKeys.password) as! String) { result, error in
            if error != nil{
                print("error")
            }else{
                let db = Firestore.firestore()
                db.collection("Users").addDocument(data: ["phoneNo":UserDefaults.standard.value(forKey: Constants.DefaultKeys.phno) ?? "","name":UserDefaults.standard.value(forKey: Constants.DefaultKeys.name) ?? "","type":UserDefaults.standard.value(forKey: Constants.DefaultKeys.type) ?? "" ,"ID":UserDefaults.standard.value(forKey: Constants.DefaultKeys.id) ?? "","uid":result!.user.uid]) { (error) in
                    if error != nil{
                        print("error showed in userdata.")
                    }
                
                }
                self.remove()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    func remove(){
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.mail)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.password)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.name)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.phno)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.id)
        UserDefaults.standard.removeObject(forKey: Constants.DefaultKeys.type)
        UserDefaults.standard.set(true,forKey: Constants.DefaultKeys.loginStatus)
    }
}
