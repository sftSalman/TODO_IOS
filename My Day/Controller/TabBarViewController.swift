//
//  TabBarViewController.swift
//  My Day
//
//  Created by Salman Farshi on 30/8/20.
//  Copyright © 2020 Salman Farshi. All rights reserved.
//

import UIKit
import Firebase

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        
        self.navigationItem.setHidesBackButton(true, animated: true)

       
    }
    

  
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
           let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    
}
