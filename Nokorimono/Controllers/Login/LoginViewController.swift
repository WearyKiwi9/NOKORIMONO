//
//  LoginViewController.swift
//  YOUC_Event_Page
//
//  Created by Tejal Patel on 3/1/19.
//  Copyright © 2019 BeverlyAb. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var customView: UIView!
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    override func viewWillAppear(_ animated: Bool) {
        
//        if (PFUser.current() != nil)
//        {
//            self.performSegue(withIdentifier: "userLoggedInTRUE", sender: self)
//        }
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
