//
//  NextBtnCell.swift
//  Designing
//
//  Created by Jenish on 15/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class NextBtnCell: UITableViewCell {

    @IBOutlet weak var NextBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        NextBtn.layer.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
