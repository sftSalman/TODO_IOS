//
//  LogInViewController.swift
//  My Day
//
//  Created by Salman Farshi on 12/8/20.
//  Copyright © 2020 Salman Farshi. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    @IBOutlet weak var EmalTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .white

        
    }
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
         if let email = EmalTextField.text,let password = passwordTextField.text{
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in

                            if let e =  error{
                                print(e)
                            }else {
                                self!.performSegue(withIdentifier:"signInToTab" , sender: self)
                            }
                
                }
            
            }
            
            
        }
        
        
    }
    

