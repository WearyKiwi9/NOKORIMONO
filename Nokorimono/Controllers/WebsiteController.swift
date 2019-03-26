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

        let url = NSURL (string:website)
        let request = NSURLRequest(url: url as! URL)
        self.recipeWebView.load(request as URLRequest)
    }
}
