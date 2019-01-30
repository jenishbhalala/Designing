//
//  ProximitePushNotificationVC.swift
//  Designing
//
//  Created by Jenish on 17/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class ProximitePushNotificationVC: UIViewController {

    @IBOutlet weak var NotInterestedButton: UIButton!
    @IBOutlet weak var InterestedButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotInterestedButton.layer.borderWidth = 1
        NotInterestedButton.layer.borderColor = UIColor.black.cgColor
        NotInterestedButton.layer.cornerRadius = 20
        InterestedButton.layer.cornerRadius = 20
        
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
