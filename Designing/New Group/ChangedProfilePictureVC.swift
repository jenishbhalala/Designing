//
//  ChangedProfilePictureVC.swift
//  Designing
//
//  Created by Jenish on 21/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class ChangedProfilePictureVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var ProfilePictureImage: UIImageView!
    
    @IBOutlet weak var CaptureBtn: UIButton!
    
    @IBOutlet weak var PhotosBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(Professional(_:)))
        // Do any additional setup after loading the view.
    }
    @IBAction func Professional(_ sender: AnyObject){
        
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "UpdateProfessionVC") as! UpdateProfessionVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
    
    @IBAction func ProfilePictureSelect(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
       actionSheet.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.gray
        
        
//        actionSheet.view.backgroundColor =
        //actionSheet.view.backgroundColor = UIColor.gray
        
    let cameraaction = UIAlertAction(title: "Take Photo", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            
            self.camera()
        })
   cameraaction.setValue(UIColor.orange, forKey: "titleTextColor")
        
        
            actionSheet.addAction(cameraaction)
        
     let gallaryaction =  UIAlertAction(title: "Choose Photo", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        })
         gallaryaction.setValue(UIColor.black, forKey: "titleTextColor")
        actionSheet.addAction(gallaryaction)
        
         let cancelaction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        cancelaction.setValue(UIColor.black, forKey: "titleTextColor")
        actionSheet.addAction(cancelaction)
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        ProfilePictureImage.image  = tempImage
        self.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){

        self.dismiss(animated: true, completion: nil)
    }
    
    
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.camera
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
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
