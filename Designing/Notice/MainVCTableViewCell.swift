//
//  MainVCTableViewCell.swift
//  Designing
//
//  Created by Jenish on 19/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class MainVCTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var UsernameLbl: UILabel!
    @IBOutlet weak var DateLbl: UILabel!
    @IBOutlet weak var RequestansLbl: UILabel!
    
    @IBOutlet weak var QuestionLbl: UILabel!
    
    @IBOutlet weak var ignorebtn: UIButton!
    @IBOutlet weak var AnswerBtn: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ProfilePicture.layer.cornerRadius = self.ProfilePicture.frame.size.width / 2
        self.ProfilePicture.clipsToBounds = true
        self.ignorebtn.layer.cornerRadius = self.ignorebtn.frame.height/2
         self.ignorebtn.clipsToBounds = true
        self.AnswerBtn.layer.cornerRadius = self.AnswerBtn.frame.height/2
        self.AnswerBtn.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
