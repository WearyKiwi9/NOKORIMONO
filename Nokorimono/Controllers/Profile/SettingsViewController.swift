//
//  SettingsViewController.swift
//  Nokorimono
//
//  Created by Tejal Patel on 1/19/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let user = PFUser.current()!
        firstNameField.text = (user["name"] as! String)
        emailField.text = (user["email"] as! String)
        usernameField.text = user.username
        passwordField.text = user.password
    }
    
    @IBAction func onSave(_ sender: Any) {
        let user = PFUser.current()!
        user["name"] = firstNameField.text
        user["email"] = emailField.text
        user.username = usernameField.text
        user.password = passwordField.text
        user.saveInBackground { (success, error) in
            if success {
                print("changes saved")
            } else {
                print("changes not saved")
            }
        }
        reloadInputViews()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        self.performSegue(withIdentifier: "unwindToLogin", sender: self)
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.2
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        navigationController?.popViewController(animated: true)
    }
}
