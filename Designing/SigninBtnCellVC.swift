
//
//  SigninBtnCellVC.swift
//  Designing
//
//  Created by Jenish on 15/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SigninBtnCellVC: UITableViewCell {

    @IBOutlet weak var Loginbtn: UIButton!
    
    
    @IBOutlet weak var ForgotPassword: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Loginbtn.layer.cornerRadius = Loginbtn.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
