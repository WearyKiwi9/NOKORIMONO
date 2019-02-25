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
    @IBOutlet weak var dishField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            dishField.isHidden = false
            nextButton.isHidden = true
            enterButton.isHidden = false
        case 1:
            dishField.isHidden = true
            nextButton.isHidden = false
            enterButton.isHidden = true
        default:
            break
        }
    }
    
    var search = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishField.isHidden = true
        nextButton.isHidden = true
        enterButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DishSegue" {
            let vc = segue.destination as! NokorimonoViewController
            vc.search = dishField.text ?? "chicken"
            dishField.text = ""
        } else if segue.identifier == "IngredientSegue" {
            let ic = segue.destination as! IngredientsViewController
            //controller.history = self.history
        }  else if segue.identifier == "ProfileSegue" {
            let pc = segue.destination as! ProfileViewController
        } else if segue.identifier == "AddRecipeSegue" {
            let arc = segue.destination as! AddRecipeViewController
        }
    }
}
