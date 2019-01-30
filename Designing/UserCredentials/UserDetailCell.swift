//
//  UserDetailCell.swift
//  Designing
//
//  Created by Jenish on 15/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class UserDetailCell: UITableViewCell {

    @IBOutlet weak var UserDetailLabel: UILabel!
    @IBOutlet weak var UserDetailTextEdit: UITextField!
   
    override func awakeFromNib() {
        super.awakeFromNib()
       UserDetailTextEdit.layer.cornerRadius = 25
       UserDetailTextEdit.clipsToBounds = true
      
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.UserDetailTextEdit.frame.height))
        UserDetailTextEdit.leftView = paddingView
        UserDetailTextEdit.leftViewMode = UITextField.ViewMode.always
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
