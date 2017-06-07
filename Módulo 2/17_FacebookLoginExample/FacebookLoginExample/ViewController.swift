//
//  ViewController.swift
//  FacebookLoginExample
//
//  Created by Ricardo López on 12/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
//import FBSDKCoreKit
//import FBSDKLoginKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    @IBOutlet weak var facebookLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        /*
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        view.addSubview(loginButton)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookLogginButtonPressed(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn([.publicProfile, .email, .userFriends], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print("Error \(error.localizedDescription)")
            case .cancelled:
                print("Usuario canceló el login")
            //case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            case .success:
                print("Logged in!")
                self.facebookLoginButton.setTitle("Cerrar sesión", for: .normal)
                //self.loadUserIfo()
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SHOW_APP_MAIN_SCREEN"), object: nil)
                
            }
        }
    }
    
}







