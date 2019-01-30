//
//  WarningVC.swift
//  Designing
//
//  Created by Jenish on 17/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class WarningVC: UIViewController {

    @IBOutlet weak var BackButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       BackButton.layer.cornerRadius = 20
       
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
