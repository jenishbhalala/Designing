//
//  RegistrationTableViewController.swift
//  Designing
//
//  Created by Jenish on 12/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

enum FormCellType:Int, CaseIterable{
    
    case name
    case email
    case password
    case repassword
    
}

class RegistrationTableViewController: UIViewController {

    @IBOutlet weak var Signupbtn: UIButton!
    
    @IBOutlet weak var RegistrationTableview: UITableView!
    
    //var cellTypes = [FormCellType]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        RegistrationTableview.isScrollEnabled = false
        RegistrationTableview.separatorStyle = .none
        self.RegistrationTableview.reloadData()
         Signupbtn.layer.cornerRadius = 25
    }


}
extension RegistrationTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
extension RegistrationTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return FormCellType.allCases.count
     }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationTableCelllVC", for: indexPath) as! RegistrationTableCelllVC
    
    
   
  switch FormCellType (rawValue: indexPath.row)! {
 

  case .name:

    //rcell.RegTextFields.placeholder = "username"
    cell.RegTextFields.attributedPlaceholder = NSAttributedString(string: "Username",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    let repasswordImage = UIImage(named: "Username_Icon")
    addLeftImageInTextFields(textField: cell.RegTextFields, andImage: repasswordImage!)
    cell.RegTextFields.tag = 101
    
  case .email:
    // cell.RegTextFields.placeholder = "E-mail"
    cell.RegTextFields.attributedPlaceholder = NSAttributedString(string: "E-mail",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    let repasswordImage = UIImage(named: "Email_icon")
    addLeftImageInTextFields(textField: cell.RegTextFields, andImage: repasswordImage!)
    cell.RegTextFields.tag = 102
    case .password:
        
       // cell.RegTextFields.placeholder = "Password"
        cell.RegTextFields.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        let repasswordImage = UIImage(named: "Password_icon")
        addLeftImageInTextFields(textField: cell.RegTextFields, andImage: repasswordImage!)
    cell.RegTextFields.tag = 103
     case .repassword:
        //cell.RegTextFields.placeholder = "Re-Password"

        cell.RegTextFields.attributedPlaceholder = NSAttributedString(string: "Re-Password",
                                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    let repasswordImage = UIImage(named: "Re_Enter_Password")
    addLeftImageInTextFields(textField: cell.RegTextFields, andImage: repasswordImage!)
    cell.RegTextFields.tag = 104
   }
    

            return cell


}
    func addLeftImageInTextFields(textField :UITextField, andImage img:UIImage){
        
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width*3/2, height: img.size.height/2))
        leftimageview.contentMode = .center
        leftimageview.image = img
        textField.leftView = leftimageview
        textField.leftViewMode = .always
    }

}
