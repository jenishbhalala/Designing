//
//  ViewController.swift
//  Designing
//
//  Created by Jenish on 11/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import GoogleSignIn
import TwitterKit



class ViewController: UIViewController,GIDSignInDelegate, GIDSignInUIDelegate {
   
    
    @IBOutlet weak var LoginBtn: UIButton!
    
    @IBOutlet weak var SignupBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
         GIDSignIn.sharedInstance().clientID = "671021176712-5037el269c2jhap59qhgibpqr0bulvvr.apps.googleusercontent.com"
         GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
      //  GIDSignIn.sharedInstance().uiDelegate = self as! GIDSignInUIDelegate
        // Do any additional setup after loading the view, typically from a nib.
        LoginBtn.layer.cornerRadius = 25
        SignupBtn.layer.cornerRadius = 25
        SignupBtn.layer.borderWidth = 1
        SignupBtn.layer.borderColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
    }
   

    @IBAction func LoginWithGoogle(_ sender: Any) {
       GIDSignIn.sharedInstance().signIn()
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        if error == nil {
            
            print(user.userID)
            print(user.authentication.accessToken)
            print(user.profile.name)
            print(user.profile.email)
            
        }else{
            
            print("\(error.localizedDescription)")
        }
        
    }
    
    
  
    @IBAction func LoginWithFacebook(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile,.email,.userBirthday] , viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print(accessToken)
                
                print("Logged in!")
            }
        }
    }
    
    
    @IBAction func LoginWithInstagramme(_ sender: Any) {
    }
    
    
    @IBAction func LoginwithTwitter(_ sender: Any) {
        
//        let account = ACAccountStore()
//        let accountType = account.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
//
//        account.requestAccessToAccounts(with: accountType, options: nil, completion: {(success, error) in
//            if success {
//                if let twitterAccount = account.accounts(with: accountType).last as? ACAccount {
//                    print("signed in as \(String(describing: twitterAccount.username))")
//                }
//            }
//        })
        TWTRTwitter.sharedInstance().logIn {(session,error) in
            if let sess = session {
                print(session as Any)
                print(session?.authToken)
                
                print("signed in as \(sess.userName)");
            } else {
                print("error: \(error!.localizedDescription)");
            }
    }
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
  
    
}

