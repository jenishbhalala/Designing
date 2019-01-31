//
//  SuggestedNetworkCollectionCell.swift
//  Designing
//
//  Created by Jenish on 31/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SuggestedNetworkCollectionCell: UICollectionViewCell {
    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBOutlet weak var UsernameLbl: UILabel!
    @IBOutlet weak var IndicatorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.ProfileImage.layer.cornerRadius = self.ProfileImage.frame.size.width / 2;
        self.ProfileImage.clipsToBounds = true;
        
        
        
        
    }


}
