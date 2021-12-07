//
//  UserTypeTableViewCell.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 06/11/21.
//

import UIKit

class UserTypeTableViewCell: UITableViewCell {

    @IBOutlet var UserTypeText: UILabel!
    @IBOutlet var viewType: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewType.layer.cornerRadius = 16
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
