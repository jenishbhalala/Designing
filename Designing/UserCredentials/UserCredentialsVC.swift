//
//  UserCredentialsVC.swift
//  Designing
//
//  Created by Jenish on 15/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class UserCredentialsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    enum ForCellUserCredentials:Int, CaseIterable{
        
        case Title
        case Company
        case Recognition
        case Degree
        case USA
        case Texas
        case City
        case NextButton
        
        
    }

    @IBOutlet weak var UserCredentialsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(VerificationVC.keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(VerificationVC.keyboardWillHide(sender:)), name:UIResponder.keyboardWillHideNotification, object: nil)
        UserCredentialsTableView.separatorStyle = .none
        
//        UserCredentialsTableView.delegate = self
//        UserCredentialsTableView.dataSource = self
        self.UserCredentialsTableView.estimatedRowHeight = 88.0
        UserCredentialsTableView.allowsSelection = false
        self.UserCredentialsTableView.rowHeight = UITableView.automaticDimension
    
    }
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            UserCredentialsTableView.contentInset = UIEdgeInsets.zero
        } else {
            UserCredentialsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        UserCredentialsTableView.scrollIndicatorInsets = UserCredentialsTableView.contentInset
        
       // let selectedRange = UserCredentialsTableView.selectedRange
    //UserCredentialsTableView.cel(selectedRange)
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -200 // Move view 200 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ForCellUserCredentials.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         switch ForCellUserCredentials (rawValue: indexPath.row)! {
         case .Title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "Profession/Title/MOS/Trade/Specialty"
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "Title",
                                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
         case .Company:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "Org/Foundation/Company/Ed Institution"
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "Company",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            return cell
         case .Recognition:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "Awards/Recognition/Badges/Campaigns"
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "Recognition",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
         case .Degree:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "Degree/Major/Licenses/Certifications/Training/Skills"
       
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "Degree",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            return cell
         case .USA:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "Country"
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "USA",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            return cell
         case .Texas:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "State/Province/Territory"
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "Texas",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            return cell
         case .City:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailCell", for: indexPath) as! UserDetailCell
            cell.UserDetailLabel.text = "Arlington"
            cell.UserDetailTextEdit.attributedPlaceholder = NSAttributedString(string: "City",
                                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
            
            return cell
         case .NextButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NextBtnCell", for: indexPath) as! NextBtnCell
            
            return cell
        }
    }
    

  

}
