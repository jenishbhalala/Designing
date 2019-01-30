//
//  FiltersTableViewCell.swift
//  Designing
//
//  Created by Jenish on 17/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class FiltersTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var FilterTextField: UITextField!
    @IBOutlet weak var FilterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        FilterTextField.layer.cornerRadius = 25
        FilterTextField.clipsToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.FilterTextField.frame.height))
        FilterTextField.leftView = paddingView
        FilterTextField.leftViewMode = UITextField.ViewMode.always
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
