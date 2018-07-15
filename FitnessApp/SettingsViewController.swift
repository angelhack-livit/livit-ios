//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/15/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var settingsTableViewController: UITableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
}
