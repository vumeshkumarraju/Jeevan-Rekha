//
//  settingsCell.swift
//  Jeevan-Rekha
//
//  Created by V UMESH KUMAR RAJU on 07/12/21.
//

import UIKit

class settingsCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
