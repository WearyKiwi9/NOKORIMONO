//
//  InputViewController.swift
//  Nokorimono
//
//  Created by Tejal Patel on 1/20/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var ingredientInputField: UITextField!
    @IBOutlet weak var dishField: UITextField!
    
    var search = ""
    var ingredients: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! NokorimonoViewController
        vc.search = dishField.text ?? "chicken"
        vc.ingredients = (ingredientInputField.text?.split{$0 == " "}.map(String.init) ?? [])
    }
    
    func scanbutton(sender:UIButton!) {
        performSegue(withIdentifier: "enterButton", sender: self)
    }

}
