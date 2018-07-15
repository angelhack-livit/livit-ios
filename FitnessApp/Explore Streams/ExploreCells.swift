//
//  ExploreCells.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation
import UIKit

class exploreCell: UITableViewCell {
    

    @IBOutlet weak var postImage: UIImageView! // Back
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var descriptionOfVideo: UILabel!
    @IBOutlet weak var numberOfViewsDescription: UILabel!
    @IBOutlet weak var numberOfViewers: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func prepareForReuse() {
//        postImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
