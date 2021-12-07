//
//  PatientTableViewCell.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 07/11/21.
//

import UIKit

class PatientTableViewCell: UITableViewCell {

    @IBOutlet var PatientImage: UIImageView!
    @IBOutlet var PatientName: UILabel!
    @IBOutlet var PatientId: UILabel!
    @IBOutlet var Suffering: UILabel!
    @IBOutlet var condition: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
