//
//  InstagrammeloginVC.swift
//  Designing
//
//  Created by Jenish on 23/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit


class InstagrammeloginVC: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var WebviewInsta: UIWebView!
    
     override func viewDidLoad() {
        super.viewDidLoad()

        
        WebviewInsta.delegate = self
        signInRequest()
        
        // Do any additional setup after loading the view.
    }
    
    func signInRequest() {
        
         // let url = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True",
        let url = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments:[instagrammeDetail.INSTAGRAM_AUTHURL,instagrammeDetail.INSTAGRAM_CLIENT_ID,instagrammeDetail.INSTAGRAM_REDIRECT_URI,instagrammeDetail.INSTAGRAM_SCOPE])
        let request = URLRequest.init(url: URL.init(string: url)!)
        
        print(request)
        print(url)
        WebviewInsta.loadRequest(request)
        
    }
    func checkrequestforcallback(request: URLRequest) -> Bool{
        
        let URLstring = (request.url?.absoluteString)! as String
        
        if URLstring.hasPrefix(instagrammeDetail.INSTAGRAM_REDIRECT_URI)
        {
            let range:   Range<String.Index> = URLstring.range(of: "#access_token=")!
            getAuthToken(authtoken: URLstring.substring(from: range.upperBound))
            return false
        }
        return true
        
        
    }
    func getAuthToken(authtoken: String){
        let url =  String(format:"https://api.instagram.com/v1/users/self/?access_token=%@",authtoken)
        
    
        let request:NSMutableURLRequest = NSMutableURLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request as URLRequest){ (data,reponse,error) ->  Void in


             if let data = data
             {
                let json = try?  JSONSerialization.jsonObject(with: data, options:[]) as! NSDictionary
                let strFullname = (json?.value(forKey: "data") as AnyObject).value(forKey: "full_name") as? String
                print(strFullname as Any)
                print((json?.value(forKey: "data") as AnyObject))
               
                let refreshAlert = UIAlertController(title: "Login Success", message: "Login Successfull.", preferredStyle: UIAlertController.Style.alert)
                
                refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    
                    DispatchQueue.main.async {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                        self.present(nextViewController, animated:true, completion:nil)

                    }
                    
                  
                }))
                
            
                
                self.present(refreshAlert, animated: true, completion: nil)
               
                
            }
            

        }.resume()
        
        
        
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        return checkrequestforcallback(request: request)
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
