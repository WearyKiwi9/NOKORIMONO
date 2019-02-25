//
//  SocialViewController.swift
//  Nokorimono
//
//  Created by Tejal Patel on 2/25/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreatePostSegue" {
            let vc = segue.destination as! CreatePostViewController
        }
    }
}
