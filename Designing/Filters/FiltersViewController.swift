//
//  FiltersViewController.swift
//  Designing
//
//  Created by Jenish on 17/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    @IBOutlet weak var FiltersTableView: UITableView!
    enum ForCellFilters:Int, CaseIterable{
        
        case Title
        case Company
        case Recognition
        case Degree
        case NextButton
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        FiltersTableView.separatorStyle = .none
        
        self.FiltersTableView.estimatedRowHeight = 100.0
        FiltersTableView.allowsSelection = false
        self.FiltersTableView.rowHeight = UITableView.automaticDimension

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ForCellFilters.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ForCellFilters (rawValue: indexPath.row)! {
            
            
            
        case .Title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersTextFieldTableViewCell", for: indexPath) as! FiltersTextFieldTableViewCell
            cell.FilterLabel.text = "Profession/Title/MOS/Trade/Specialty"
            cell.FilterTextField.attributedPlaceholder = NSAttributedString(string: "Title",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
        case .Company:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersTextFieldTableViewCell", for: indexPath) as! FiltersTextFieldTableViewCell
            cell.FilterLabel.text = "Org/Foundation/Company/Ed Institution"
            cell.FilterTextField.attributedPlaceholder = NSAttributedString(string: "Company",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
        case .Recognition:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersTextFieldTableViewCell", for: indexPath) as! FiltersTextFieldTableViewCell
            cell.FilterLabel.text = "Awards/Recognition/Badges/Campaigns"
            cell.FilterTextField.attributedPlaceholder = NSAttributedString(string: "Recognition",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
        case .Degree:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersTextFieldTableViewCell", for: indexPath) as! FiltersTextFieldTableViewCell
            cell.FilterLabel.text = "Degree/Major/Licenses/Certifications/Training/Skills"
            cell.FilterTextField.attributedPlaceholder = NSAttributedString(string: "Degree",
                                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
        case .NextButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FiltersButtonTableViewCell", for: indexPath) as! FiltersButtonTableViewCell
            
            return cell
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
