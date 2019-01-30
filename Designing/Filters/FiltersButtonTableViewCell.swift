//
//  FiltersButtonTableViewCell.swift
//  Designing
//
//  Created by Jenish on 17/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class FiltersButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var FilterNextBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         FilterNextBtn.layer.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
