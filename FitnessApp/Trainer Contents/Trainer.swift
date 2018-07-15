//
//  SecondViewController.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class TrainerTableViewController: UITableViewController {

    @IBOutlet var tableViewControl: UITableView!
    @IBOutlet var collectionViewControl: UICollectionView!

    
        var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 250
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Basic Setup
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard cell is trainerCells else { return }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "openAgora", sender: self)
//        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}



