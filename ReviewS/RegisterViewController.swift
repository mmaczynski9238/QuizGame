//
//  RegisterViewController.swift
//  ReviewS
//
//  Created by student3 on 10/24/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let repeatPassword = repeatTextField.text!
        
        if (username.isEmpty || password.isEmpty || repeatPassword.isEmpty){
            
        
            return
        }
        
        
    }
    
    
    
    
    func displayAlertMessage(_ userMessage: String){
        let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
    }
    


}
