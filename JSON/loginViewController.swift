//
//  loginViewController.swift
//  JSON
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class loginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginButton(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (usr, error) in
            
            if error != nil {
                print(error)
                self.logIn()
            } else {
                self.logIn()
                print("User has been created!")
            }
            
        }
        
    }
    
    func logIn() {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (usr, err) in
            if err != nil {
                print(err)
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Successfully Logged In!")
                
                
            }
        }
    }
    

}
