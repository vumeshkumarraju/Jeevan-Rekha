//
//  PatientViewController.swift
//  JeevanRekha
//
//  Created by V UMESH KUMAR RAJU on 24/11/21.
//

import UIKit

class PatientViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    


    @IBOutlet var PatientTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    
    var patients : [patient] = [patient(name: "Abhisek Singh", pID: "ACT001", disease: "CoVID", status: pStatus.crtical, age: 52),patient(name: "Sohaib Mathur", pID: "BCT105", disease: "Hepatitis", status: pStatus.fine, age: 55)]
    
    var filteredPatient : [patient] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PatientTableView.delegate = self
        PatientTableView.dataSource = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = " Search "
        navigationItem.searchController = searchController
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive{
            return filteredPatient.count
        }else{
            return patients.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PatientTableView.dequeueReusableCell(withIdentifier: "PatientTableViewCell", for: indexPath) as! PatientTableViewCell
        if searchActive{
            cell.PatientId.text = "Patient id : \(filteredPatient[indexPath.row].pID)"
            cell.PatientName.text = filteredPatient[indexPath.row].name
            cell.PatientImage.image = UIImage(named: filteredPatient[indexPath.row].name)
            cell.Suffering.text = "Suffering : \(filteredPatient[indexPath.row].disease)"
            switch filteredPatient[indexPath.row].status{
            case .crtical:
                cell.condition.tintColor = UIColor(named: "Lev1")
            case .moderate:
                cell.condition.tintColor = UIColor(named: "Lev2")
            case .fine:
                cell.condition.tintColor = UIColor(named: "Lev3")
            }

        }
        else{
            cell.PatientId.text = "Patient id : \(patients[indexPath.row].pID)"
            cell.PatientName.text = patients[indexPath.row].name
            cell.PatientImage.image = UIImage(named: patients[indexPath.row].name)
            cell.Suffering.text = "Suffering : \(patients[indexPath.row].disease)"
            switch patients[indexPath.row].status{
            case .crtical:
                cell.condition.tintColor = UIColor(named: "Lev1")
            case .moderate:
                cell.condition.tintColor = UIColor(named: "Lev2")
            case .fine:
                cell.condition.tintColor = UIColor(named: "Lev3")
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PatientDetailViewController") as! PatientDetailViewController
        
        if searchActive{
            vc.storePatient(model: filteredPatient[indexPath.row])
        }else{
            vc.storePatient(model: patients[indexPath.row])
        }
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: Search Bar
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchActive = true;
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchActive = false;
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;
            searchController.searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPatient = patients.filter({ (getPatient : patient) -> Bool in
            return (getPatient.pID.lowercased().contains(searchText.lowercased()) || getPatient.name.lowercased().contains(searchText.lowercased()) || getPatient.disease.lowercased().contains(searchText.lowercased()))
        })
        
        if(searchText.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.PatientTableView.reloadData()
    }
}
