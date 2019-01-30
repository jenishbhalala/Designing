//
//  SignUpViewController.swift
//  Designing
//
//  Created by Jenish on 12/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

   
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SignupButton: UIButton!
    @IBOutlet weak var ReEnterPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UsernameTextField.layer.cornerRadius = 25
        UsernameTextField.clipsToBounds = true
        UsernameTextField.layer.borderWidth = 1
        UsernameTextField.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
        let usernameImage = UIImage(named: "Username_Icon")
        addLeftImageInTextField(textField: UsernameTextField, andImage: usernameImage!)
        
        EmailTextField.layer.cornerRadius = 25
        EmailTextField.clipsToBounds = true
        EmailTextField.layer.borderWidth = 1
        EmailTextField.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
        let emailImage = UIImage(named: "Email_icon")
        addLeftImageInTextField(textField: EmailTextField, andImage: emailImage!)
        
        PasswordTextfield.layer.cornerRadius = 25
        PasswordTextfield.clipsToBounds = true
        PasswordTextfield.layer.borderWidth = 1
        PasswordTextfield.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
        let passwordImage = UIImage(named: "Password_icon")
        addLeftImageInTextField(textField: PasswordTextfield, andImage: passwordImage!)
        
        ReEnterPasswordTextField.layer.cornerRadius = 25
        ReEnterPasswordTextField.clipsToBounds = true
        ReEnterPasswordTextField.layer.borderWidth = 1
        ReEnterPasswordTextField.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
        let repasswordImage = UIImage(named: "Re_Enter_Password")
        addLeftImageInTextField(textField: ReEnterPasswordTextField, andImage: repasswordImage!)
        
        SignupButton.layer.cornerRadius = 25
        
        
        
        // Do any additional setup after loading the view.
    }

    func addLeftImageInTextField(textField :UITextField, andImage img:UIImage){
        
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width*3/2, height: img.size.height/2))
        leftimageview.contentMode = .center
        leftimageview.image = img
        textField.leftView = leftimageview
        textField.leftViewMode = .always
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
