//
//  FirstViewController.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ExploreTableViewController: UITableViewController  {

        var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    @IBOutlet var exploreTableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("https://coachy.herokuapp.com/training_sessions/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar.arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.exploreTableViewController.reloadData()
                }
            }
        }
        
        tableView.estimatedRowHeight = 250
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(arrRes.count)
        let value:Int = arrRes.count + 100
        return value
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreCellHandler", for: indexPath as IndexPath) as! exploreCell
//        var dict = arrRes[(indexPath as NSIndexPath).row]
//
//        let user_count = dict["users_count"] as? Int
//
//        cell.numberOfViewers.text = "\(user_count!)"
//        cell.numberOfViewsDescription.text = "\(user_count!) People Watching"
//        cell.descriptionOfVideo.text = dict["description"] as? String
//        cell.postTitle.text = dict["name"] as? String
//
//        let imageURL = dict["back_ground_image"] as? String
//        let url = URL(string: imageURL!)
//
//        print(url!)
//
//        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard let data = data, error == nil else { return }
//
//            DispatchQueue.main.async() {    // execute on main thread
//                cell.postImage.image = UIImage(data: data)
//            }
//        }
//
//        task.resume()
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.00
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "openAgora", sender: nil)
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController:
            UIViewController = UIStoryboard(
                name: "Main", bundle: nil
                ).instantiateViewController(withIdentifier: "VideoChatViewController") as! VideoChatViewController
        
        self.present(viewController, animated: false, completion: nil)
        
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        // Implement code for session ID for multiple different views
        //            let indexPath = self.tableView.indexPathForSelectedRow
        //            let cell = tableView.cellForRow(at: indexPath!)
    }
}

