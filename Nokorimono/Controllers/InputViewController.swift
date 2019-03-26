//
//  InputViewController.swift
//  Nokorimono
//
//  Created by Tejal Patel on 1/20/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var dishField: UITextField!
    
    var search = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dishField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self.view, action: Selector("endEditing:"))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if dishField.text != "" {
                let vc = segue.destination as! NokorimonoViewController
                vc.search = dishField.text ?? "chicken"
                dishField.text = ""
                vc.hidesBottomBarWhenPushed = true
            } else {
                let alertController = UIAlertController(title: "Nokorimono", message:
                    "Enter a dish name", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
}
