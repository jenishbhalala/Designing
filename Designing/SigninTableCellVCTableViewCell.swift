//
//  SigninTableCellVCTableViewCell.swift
//  Designing
//
//  Created by Jenish on 15/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SigninTableCellVCTableViewCell: UITableViewCell {

    @IBOutlet weak var TextFieldTableviewCell: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        TextFieldTableviewCell.layer.cornerRadius = TextFieldTableviewCell.frame.height/2
        
        TextFieldTableviewCell.layer.borderWidth = 1.0
        TextFieldTableviewCell.layer.borderColor = UIColor.white.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
