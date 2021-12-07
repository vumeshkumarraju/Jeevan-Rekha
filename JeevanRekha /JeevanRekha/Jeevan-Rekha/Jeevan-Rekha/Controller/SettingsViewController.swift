//
//  SettingsViewController.swift
//  Jeevan-Rekha
//
//  Created by V UMESH KUMAR RAJU on 07/12/21.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet var SettingTableView: UITableView!
    var sectionHeaders:[String] = ["","General", "Contacts", "Others"]
    var settings = [[""],["Notifications"], ["Contact", "Share", "Our Instagram", "Our Twitter", "Our Facebook"], ["Privacy Policy"]]
    var settingIcons = [["cover"],["notificationsIcon"], ["contactIcon", "shareIcon", "instaIcon", "twitterIcon", "fbIcon", "linkedinIcon"], ["privacyIcon"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        SettingTableView.dataSource = self
        SettingTableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "CoverCell", for: indexPath) as! CoverCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! settingsCell
            cell.settingNameLabel.text = settings[indexPath.section][indexPath.row]
            cell.iconImage.image = UIImage(named: settingIcons[indexPath.section][indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 142
        }
        else{
            return 60
            
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
}
