//
//  ECGTableViewCell.swift
//  Jeevan-Rekha
//
//  Created by V UMESH KUMAR RAJU on 04/12/21.
//

import UIKit

class ECGTableViewCell: UITableViewCell {

    @IBOutlet var View: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.View.layer.cornerRadius = 10
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
