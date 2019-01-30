//
//  LearnMoreVC.swift
//  Designing
//
//  Created by Jenish on 21/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class LearnMoreVC: UIViewController {

    @IBOutlet weak var NotInterestedBtn: UIButton!
    @IBOutlet weak var InterestedBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.NotInterestedBtn.layer.cornerRadius = self.NotInterestedBtn.frame.height/2
        self.NotInterestedBtn.clipsToBounds = true
        self.NotInterestedBtn.layer.borderWidth = 1
        self.NotInterestedBtn.layer.borderColor = UIColor.black.cgColor
        self.InterestedBtn.layer.cornerRadius = self.InterestedBtn.frame.height/2
        self.InterestedBtn.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
