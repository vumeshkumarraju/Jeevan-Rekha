//
//  PatientDetailViewController.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 25/11/21.
//

import UIKit

class PatientDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var patientTableView: UITableView!
    
    var Patient = patient(name: "", pID: "", disease: "", status: pStatus.fine, age: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        patientTableView.dataSource = self
        patientTableView.delegate = self
        patientTableView.separatorStyle = .none
        patientTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    func storePatient(model : patient ){
        self.Patient = model
    }
    
    let covers : [String] = ["profile","Details","Drip Level","Pulse Rate","Temp","ECG"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = patientTableView.dequeueReusableCell(withIdentifier: "profile") as! ProfileTableViewCell
            cell.storePatient(model: self.Patient)
            return cell
        }
        else if indexPath.row == 1{
            let cell = patientTableView.dequeueReusableCell(withIdentifier: "Details") as! DetailTableViewCell
            return cell
        }
        else if indexPath.row == 2{
            let cell = patientTableView.dequeueReusableCell(withIdentifier: "Drip Level") as! DripTableViewCell
            return cell
        }
        else if indexPath.row == 3{
            let cell = patientTableView.dequeueReusableCell(withIdentifier: "Pulse Rate") as! PRTableViewCell
            return cell
        }
        else if indexPath.row == 4{
            let cell = patientTableView.dequeueReusableCell(withIdentifier: "Temp") as! TempTableViewCell
            return cell
        }
        else{
            let cell = patientTableView.dequeueReusableCell(withIdentifier: "ECG") as! ECGTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 255
        }
        else if indexPath.row == 1{
            return 182
        }
        else if indexPath.row == 2{
            return 138
        }
        else if indexPath.row == 3{
            return 138
        }
        else if indexPath.row == 4{
            return 110
        }
        else{
            return 138
        }
    }

}
