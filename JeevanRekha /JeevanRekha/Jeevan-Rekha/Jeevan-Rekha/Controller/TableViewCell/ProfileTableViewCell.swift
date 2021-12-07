//
//  ProfileTableViewCell.swift
//  Jeevan-Rekha
//
//  Created by V UMESH KUMAR RAJU on 04/12/21.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet var PatientImage: UIImageView!
    @IBOutlet var PatientName: UILabel!
    @IBOutlet var PatientID: UILabel!
    @IBOutlet var Statud: UILabel!

    
    var Patient = patient(name: "", pID: "", disease: "", status: pStatus.fine, age: 40)
    var Stat = pStatus.fine
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        // Initialization code
    }
    func storePatient(model : patient ){
        self.Patient = model
        PatientName.text = Patient.name
        PatientImage.image = UIImage(named: Patient.name)
        PatientID.text = "Patient ID : \(Patient.pID)"
        Stat = Patient.status
        switch Stat{
        case .crtical:
            Statud.text = "Status : Critical"
            Statud.textColor = UIColor(named: "Lev1")
        case .moderate:
            Statud.text = "Status : Moderate"
            Statud.textColor = UIColor(named: "Lev2")
        case .fine:
            Statud.text = "Status : Fine"
            Statud.textColor = UIColor(named: "Lev3")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
