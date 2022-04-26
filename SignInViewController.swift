//
//  SignInViewController.swift
//  BookRec
//
//  Created by TEJVEER SINGH on 2022-04-23.
//  Copyright © 2022 barley. All rights reserved.
//

import UIKit
import Firebase
class SignInViewController: UIViewController {
 
   
    @IBOutlet weak var FirstName: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
    @IBAction func SingUpPressed(_ sender: UIButton) {
        
        let email = FirstName.text!
        let password = passwordTextfield.text!
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error{
                print(e.localizedDescription)
                showToast(controller: self, message : "error in the fields", seconds: 2.0)
            }else{
              
                //navigate to chat view controller
                self.performSegue(withIdentifier: "GoToSignIn", sender: self)
            }
        }
    }
    
    
    
    
}
