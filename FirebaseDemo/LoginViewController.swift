//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Mohamed Kelany on 6/10/18.
//  Copyright © 2018 Mohamed Kelany. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login_TouchUpInside(_ sender: UIButton) {
        guard let email = emailTextField.text?.trimmingCharacters(in: NSCharacterSet.whitespaces), !email.isEmpty else {
            print("Email is Empty!")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            print("Password is empty!")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user: AuthDataResult?, error: Error?) in
            if let error = error {
                print(error)
                
                if error._code == 17008 {
                    print("Invalid email or password")
                }
            } else {
                if let user = user {
                    print(user)
                }
            }
            
        }
        
        //Auth.Auth()?.signInWithEmail(email, password)
    }
    
    @IBAction func register_TouchUpInside(_ sender: UIButton) {
        
    }
}

