//
//  SigninViewController.swift
//  Designing
//
//  Created by Jenish on 15/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var Headerview: UIView!
    enum FormCellTypeLogin:Int, CaseIterable{
        
        case username
        case password
        case Loginbtn
        case SignUP

        
    }

   
    @IBOutlet weak var SigninTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        SigninTableview.separatorStyle = .none
   
        SigninTableview.allowsSelection = false
        SigninTableview.delegate = self
        SigninTableview.dataSource = self
        self.SigninTableview.estimatedRowHeight = 88.0
        self.SigninTableview.rowHeight = UITableView.automaticDimension
        
  
        

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var header = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as HeaderCell
//        header.delegate = self
//        return header
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FormCellTypeLogin.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        switch FormCellTypeLogin (rawValue: indexPath.row)! {
   
    
        case .username:
          let cell = tableView.dequeueReusableCell(withIdentifier: "SigninTableCellVCTableViewCell", for: indexPath) as! SigninTableCellVCTableViewCell
            cell.TextFieldTableviewCell.attributedPlaceholder = NSAttributedString(string: "Username",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            let repasswordImage = UIImage(named: "Username_Icon")
            addLeftImageInTextFields(textField: cell.TextFieldTableviewCell, andImage: repasswordImage!)
            cell.TextFieldTableviewCell.tag = 101
            return cell
        
        case .password:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SigninTableCellVCTableViewCell", for: indexPath) as! SigninTableCellVCTableViewCell
            cell.TextFieldTableviewCell.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            let repasswordImage = UIImage(named: "Password_icon")
            addLeftImageInTextFields(textField: cell.TextFieldTableviewCell, andImage: repasswordImage!)
            cell.TextFieldTableviewCell.tag = 102
    
            return cell
    
            
        
        
        case .Loginbtn:
             let cell = tableView.dequeueReusableCell(withIdentifier: "SigninBtnCellVC", for: indexPath) as! SigninBtnCellVC
             cell.Loginbtn.addTarget(self, action:  #selector(loginbtn(_:)), for: .touchUpInside)
          return cell
      
        case .SignUP:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SignupCellVC", for: indexPath) as! SignupCellVC
            return cell
        }
        
        
   
    //return cell
    }
    @IBAction func loginbtn(_ sender: AnyObject){
        
       let index = IndexPath(row: 0, section: 0)
        let cell: SigninTableCellVCTableViewCell = self.SigninTableview.cellForRow(at: index) as! SigninTableCellVCTableViewCell
       
        let username = cell.TextFieldTableviewCell.viewWithTag(101) as? UITextField
        print(username?.text)
        
        let index1 = IndexPath(row: 1, section: 0)
        let cell1: SigninTableCellVCTableViewCell = self.SigninTableview.cellForRow(at: index1) as! SigninTableCellVCTableViewCell
        let password = cell1.TextFieldTableviewCell.viewWithTag(102) as? UITextField
        
        print(password?.text)
        
        
        
        
        // TODO :- login with instagram
        
   //   https://gist.github.com/tomkdickinson/a093d30523dd77ae970f3ffcf26e1344
//        let url1 = URL(string: "https://www.instagram.com/accounts/login/?force_classic_login")! //change the url
//        let request1 = NSMutableURLRequest(url: url1)
//        let poststring = "username=mr_jenish_bhalala&password=jenish@1101"
//        request1.httpBody = poststring.data(using: String.Encoding.utf8)
//        
//        let resp = request1.allHTTPHeaderFields
//        var headers: NSDictionary = [ "referer" : "https://www.instagram.com/",
//            "accept": "*/*",
//            "Accept-Language": "en-GB,en;q=0.8",
//            "cache-control": "no-cache",
//            "content-length": "40",
//            "Content-Type": "application/x-www-form-urlencoded",
//            "cookie": resp!["cookie_string"],
//            "origin": "https://www.instagram.com",
//            "pragma": "no-cache",
//            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36",
//            "x-csrftoken": resp!["csrf_token"],
//            "x-instagram-ajax": "1",
//            "X-Requested-With": "XMLHttpRequest"]
//        
//        request1.httpMethod = "POST"
//        request1.allHTTPHeaderFields = headers as? [String : String]
//
//
//      //  print(request.httpBody as Any)
//
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//        session.dataTask(with: request1 as URLRequest){ (data,reponse,error) ->  Void in
//             if error != nil
//             {
//
//                print(error as Any)
//                
//            }
//            let data = data
//          //  let range:   Range<String.Index> = URLstring.range(of: "#access_token=")!
//            //getAuthToken(authtoken: URLstring.substring(from: range.upperBound))
//
//            let ranges = (data?.range(of: data!))!
//            print(ranges)
//            
//            let authtoken =   ranges.index(after: 10)
//            print(authtoken)
//            print(data as Any)
//            print(reponse as Any)
//        
//        }.resume()

    }
    

    
    func addLeftImageInTextFields(textField :UITextField, andImage img:UIImage){
        
        let leftimageview = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width*3/2, height: img.size.height/2))
        leftimageview.contentMode = .center
        leftimageview.image = img
        textField.leftView = leftimageview
        textField.leftViewMode = .always
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
