//
//  VerificationVC.swift
//  Designing
//
//  Created by Jenish on 18/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
import SVProgressHUD

class VerificationVC: UIViewController {

    
 
 
    @IBOutlet weak var CodeTextField1: UITextField!
   
    @IBOutlet weak var CodeTextField2: UITextField!
    
    @IBOutlet weak var CodeTextField3: UITextField!
    
    
    @IBOutlet weak var CodeTextField4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(VerificationVC.keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(VerificationVC.keyboardWillHide(sender:)), name:UIResponder.keyboardWillHideNotification, object: nil)

        navigationItem.rightBarButtonItem = UIBarButtonItem(image:UIImage(named: "Conform_icon"), style: .done, target: self, action: #selector(VerificationCode(_:)))
        CodeTextField1.addTarget(self,action:#selector(self.textFieldDidChanged(textField:)), for: UIControl.Event.editingChanged)
        CodeTextField2.addTarget(self,action:#selector(self.textFieldDidChanged(textField:)), for: UIControl.Event.editingChanged)
        CodeTextField3.addTarget(self,action:#selector(self.textFieldDidChanged(textField:)), for: UIControl.Event.editingChanged)
        CodeTextField4.addTarget(self,action:#selector(self.textFieldDidChanged(textField:)), for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
       
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -200 // Move view 200 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
  
    @IBAction func VerificationCode(_ sender: AnyObject){
        self.addBlurEffect()
        SVProgressHUD.setGraceTimeInterval(1.0)
        SVProgressHUD.showProgress(5, status: "Authenticating")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.removeBlurEffect()
            SVProgressHUD.dismiss()
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "NoticeParentVC") as! NoticeParentVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
        
    }
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        //blurEffectView.backgroundColor = UIColor(white: 0.1, alpha: 0.2)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        view.addSubview(blurEffectView)
        
    }
    func removeBlurEffect() {
        let blurredEffectViews = view.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CodeTextField1.becomeFirstResponder()
    }
    @objc func textFieldDidChanged(textField:UITextField)
    {
        
        let text = textField.text
        
        if text?.utf8.count == 1 {
            switch textField{
                
            case CodeTextField1:
                CodeTextField2.becomeFirstResponder()
            case CodeTextField2:
                CodeTextField3.becomeFirstResponder()
            case CodeTextField3:
                CodeTextField4.becomeFirstResponder()
            case CodeTextField4:
                CodeTextField4.becomeFirstResponder()
            
            default:
                break
            
                
            }
            
        }else{
            switch textField{
                
            case CodeTextField1:
                CodeTextField1.becomeFirstResponder()
                CodeTextField1.text = ""
            case CodeTextField2:
                CodeTextField1.becomeFirstResponder()
                CodeTextField2.text = ""
            case CodeTextField3:
                CodeTextField2.becomeFirstResponder()
                CodeTextField3.text = ""
            case CodeTextField4:
                CodeTextField3.becomeFirstResponder()
                CodeTextField4.text = ""
            default:
                break
                
                
            }
            
            
            
        }
    }



}
