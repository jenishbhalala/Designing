//
//  TermConditionVC.swift
//  Designing
//
//  Created by Jenish on 17/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class TermConditionVC: UIViewController {

  
    @IBOutlet weak var TermConditionLabel: UILabel!
    
    @IBOutlet weak var AcceptButton: UIButton!
    @IBOutlet weak var DeclineButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        var Text1 = "Terms and Conditions agreements act as a legal contract between you (the company) who has the website or mobile app and the user who access your website and mobile app."
        
        var Text2 = "It’s up to you to set the rules and guidelines that the user must agree to. You can think of your Terms and Conditions agreement as the legal agreement where you maintain your rights to exclude users from your app in the event that they abuse your app, where you maintain your legal rights against potential app abusers, and so on."
        
        var Text3 = "The Intellectual Property disclosure will inform users that the contents, logo and other visual media you created is your property and is protected by copyright laws." +
        " A Termination clause will inform that users’ accounts on your website and mobile app or users’ access to your website and mobile (if users can’t have an account with you) can be terminated in case of abuses or at your sole discretion." +
        "A Governing Law will inform users which laws govern the agreement. This should the country in which your company is headquartered or the country from which you operate your website and mobile app." +
        "A Links To Other Web Sites clause will inform users that you are not responsible for any third party websites that you link to. This kind of clause will generally inform users that they are responsible for reading and agreeing (or disagreeing) with the Terms and Conditions or Privacy Policies of these third parties."
      let finaltext = "\(Text1) \(Text2) \(Text3)"
        
        TermConditionLabel.text = finaltext
        TermConditionLabel.sizeToFit()
        DeclineButton.layer.cornerRadius = 16.5
        DeclineButton.layer.borderWidth = 1
        DeclineButton.layer.borderColor = UIColor.black.cgColor
        
        AcceptButton.layer.cornerRadius = 16.5
        
        // Do any additional setup after loading the view.
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
