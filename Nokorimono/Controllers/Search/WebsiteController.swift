//
//  WebsiteController.swiftiew
//  Nokorimono
//
//  Created by Tejal Patel on 1/20/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit
import WebKit

class WebsiteController: UIViewController {
    var website = ""
    @IBOutlet var recipeWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.hidesBackButton = true

        let url = NSURL (string:website)
        let request = NSURLRequest(url: url as! URL)
        self.recipeWebView.load(request as URLRequest)
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
