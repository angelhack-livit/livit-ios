//
//  ProfileControllerHandler.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/15/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class ProfileHandler: UITabBarController, UITabBarControllerDelegate {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var arrRes = [[String:AnyObject]]() //Array of dictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    fileprivate func getJSONRequest() {
        Alamofire.request("https://coachy.herokuapp.com/users/").responseJSON { (responseData) -> Void in
            //print(responseData.result.value!)
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar.arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                print(self.arrRes)
            }
        }
    }
    
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "openAgora", sender: self)
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileVC", for: indexPath as IndexPath) as! ProfileCell
        var dict = arrRes[(indexPath as NSIndexPath).row]
        
        let imageURL = dict["image_url"] as? String
        let url = URL(string: imageURL!)
        
        cell.userProfileImage.kf.setImage(with: url)
        
        
        cell.userName.text = (dict["first_name"] as? String)! + " " + (dict["last_name"] as? String)!
        
        let currentWeightForUser = dict["weight"] as? Int
        cell.currentWeight.text = "Current Weight: \(String(describing: currentWeightForUser))"
        
        cell.location.text = dict["location"] as? String
        // cell.bio.text = dict["bio"] as? String // Implement bio's later
        cell.bio.text = "Hey im an aspiring artist, that waants to become fit!"
        
        return cell
        
    }
    
}

class ProfileCell: UITableViewCell {
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var currentWeight: UILabel!
    @IBOutlet weak var bio: UILabel!

}

