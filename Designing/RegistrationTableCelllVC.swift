//
//  RegistrationTableCelllVC.swift
//  Designing
//
//  Created by Jenish on 12/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class RegistrationTableCelllVC: UITableViewCell {

    @IBOutlet weak var RegTextFields: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    
      RegTextFields.layer.cornerRadius = 25
    
        RegTextFields.layer.borderWidth = 1.0
        RegTextFields.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
