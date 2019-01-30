
//
//  UpdateProfessionViewController.swift
//  Designing
//
//  Created by Jenish on 22/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class UpdateProfessionVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
   
  
   
    

    @IBOutlet weak var ProfessionPickerView: UIPickerView!
    
    @IBOutlet weak var AddPickerViewDataBtn: UIButton!
   
    @IBOutlet weak var ProfessionalTextField: UITextField!
    
    @IBOutlet weak var ProfessionalAddBtn: UIButton!
   
    var pickerData: [String] = [String]()
    var TextFielddata: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfessionalTextField.delegate = self;
        AddPickerViewDataBtn.layer.cornerRadius = self.AddPickerViewDataBtn.frame.height/2
        AddPickerViewDataBtn.clipsToBounds = true
        ProfessionalAddBtn.layer.cornerRadius = self.ProfessionalAddBtn.frame.height/2
        ProfessionalAddBtn.clipsToBounds = true
        ProfessionalTextField.layer.cornerRadius = self.ProfessionalTextField.frame.height/2
        ProfessionalTextField.clipsToBounds = true
        self.ProfessionPickerView.delegate = self
        self.ProfessionPickerView.dataSource = self
        pickerData = ["C","C++","PHP",".NET","Java","Objective C","Swift","Android","unix","Publick Speaaking","Business Counslting"]
        // Do any additional setup after loading the view.
     // self.textField(ProfessionalTextField, shouldChangeCharactersIn: NSRange.init(), replacementString:" ")
//       self.ProfessionalTextField.text = TextFielddata.joined(separator: ",")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    @IBAction func AddProfessionfromPickerViewToTextField(_ sender: Any) {
   
            let professionindex = ProfessionPickerView.selectedRow(inComponent: 0)
        
        let contains = TextFielddata.contains(where: { $0 == pickerData[professionindex] })
       if contains == false
       {
        TextFielddata.append(pickerData[professionindex])
       }
        self.ProfessionalTextField.text = TextFielddata.joined(separator: ",")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let  char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")

        if (isBackSpace == -92) {

           self.TextFielddata.removeAll()
            self.ProfessionalTextField.text = ""
           // print("Backspace was pressed")
        }
        print(TextFielddata)
       // self.ProfessionalTextField.text = ""

        return true
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
