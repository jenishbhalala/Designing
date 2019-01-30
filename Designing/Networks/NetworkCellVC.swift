//
//  NetworkCellVC.swift
//  Designing
//
//  Created by Jenish on 19/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class NetworkCellVC: UITableViewCell {

    @IBOutlet weak var ProfilePicNetwork: UIImageView!
    
    
    @IBOutlet weak var UsernameNetworkLbl: UILabel!
    
    @IBOutlet weak var ExpertiseLblNetwork: UILabel!
    
    @IBOutlet weak var RatingImageNetwork: UIImageView!
    
    @IBOutlet weak var JoinBtnNetwork: UIButton!
    
    @IBOutlet weak var DetailBtnNetwork: UIButton!
    
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.ProfilePicNetwork.layer.cornerRadius = self.ProfilePicNetwork.frame.size.width / 2
        self.ProfilePicNetwork.clipsToBounds = true
        self.JoinBtnNetwork.layer.cornerRadius = self.JoinBtnNetwork.frame.height/2
        self.JoinBtnNetwork.clipsToBounds = true
        self.DetailBtnNetwork.layer.cornerRadius = self.DetailBtnNetwork.frame.height/2
        self.DetailBtnNetwork.clipsToBounds = true
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
