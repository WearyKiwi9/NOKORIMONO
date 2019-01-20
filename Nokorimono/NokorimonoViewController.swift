//
//  NokorimonoViewController.swift
//  Nokorimono
//
//  Created by Tejal Patel on 1/19/19.
//  Copyright © 2019 Tejal Patel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class NokorimonoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var search = ""
    var website = ""
    var ingredients: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    var recipes = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        Alamofire.request("https://api.edamam.com/search?q=\(search)&app_id=eedecc1c&app_key=a064d0e3ff0a1ed49878358bef62b8d5&from=0&to=50").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let dataDictionary = JSON(responseData.result.value!)
                self.recipes = dataDictionary["hits"]
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        let recipe = recipes[indexPath.row]["recipe"]
        let name = recipe["label"].string
        
        cell.titleLabel.text = name
        let posterUrl = URL(string: recipe["image"].string!)
        cell.posterView.af_setImage(withURL: posterUrl!)
       
        return cell

    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WebsiteController
        vc.website = website
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]["recipe"]
        website = recipe["url"].string!
        self.performSegue(withIdentifier: "toWebsite", sender: self)
    }
}
