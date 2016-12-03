//
//  MainViewController.swift
//  ReviewS
//
//  Created by JBM on 10/19/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func loginButton(_ sender: UIButton) {
        let user = usernameField.text
        let pass = passwordField.text
        
        let usernameStored = UserDefaults.standard.string(forKey: "username")
        let passwordStored = UserDefaults.standard.string(forKey: "password")
        
        if usernameStored == user{
            if passwordStored == pass{
                UserDefaults.standard.set(true,forKey: "isLoggedIn")
                UserDefaults.standard.synchronize()
                self.dismiss(animated: true, completion: nil)
//                let viewController1: ViewController1 = ViewController1()
//                viewController1.view.backgroundColor = UIColor.blue
                
//                self.present(viewController1, animated: true, completion: nil)
            }
            
            else if passwordStored != pass{
//                let viewController1: ViewController1 = ViewController1()
//                viewController1.view.backgroundColor = UIColor.red
                }
                
            
            
        }
        
    }

}

