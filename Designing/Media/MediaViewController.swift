//
//  MediaViewController.swift
//  Designing
//
//  Created by Jenish on 19/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit


class MediaViewController: UIViewController {

    @IBOutlet weak var UploadBtn: UIButton!
    @IBOutlet weak var DownloadBtn: UIButton!
    @IBOutlet weak var ShareBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.UploadBtn.layer.cornerRadius = self.UploadBtn.frame.height/2
        self.UploadBtn.clipsToBounds = true
        self.UploadBtn.setImage(UIImage(named: "Upload_icon"), for: .normal)
        self.UploadBtn.tintColor = UIColor.white
        self.UploadBtn.imageEdgeInsets = UIEdgeInsets(top: 6,left: 0,bottom: 6,right:130)
        
        self.DownloadBtn.layer.cornerRadius = self.DownloadBtn.frame.height/2
        self.DownloadBtn.clipsToBounds = true
        self.DownloadBtn.setImage(UIImage(named: "Download_icon"), for: .normal)
         self.DownloadBtn.tintColor = UIColor.white
        self.DownloadBtn.imageEdgeInsets = UIEdgeInsets(top: 6,left: 0,bottom: 6,right:110)
        
        self.ShareBtn.layer.cornerRadius = self.ShareBtn.frame.height/2
        self.ShareBtn.clipsToBounds = true
        self.ShareBtn.setImage(UIImage(named: "Share_icon"), for: .normal)
         self.ShareBtn.tintColor = UIColor.white
        self.ShareBtn.imageEdgeInsets = UIEdgeInsets(top: 6,left: 0,bottom: 6,right:140)
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
