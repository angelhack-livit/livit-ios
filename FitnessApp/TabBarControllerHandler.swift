//
//  TabBarControllerHandler.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation
import UIKit

class TabBarControllerHandler: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStylization()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    fileprivate func setupStylization() {
        let customTabBar = self.tabBar
        customTabBar.backgroundColor = flatWhite()
        view.backgroundColor = .white
        
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedStringKey.font: UIFont(name: "Poppins-Light", size: 10)!],
                for: .normal)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
