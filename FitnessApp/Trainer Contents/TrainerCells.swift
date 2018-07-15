//
//  TrainerCells.swift
//  FitnessApp
//
//  Created by Jamal Rasool on 7/14/18.
//  Copyright © 2018 Jamal Rasool. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class trainerCells: UITableViewCell {
    
    
    @IBOutlet weak var collectionViewTrainer: UICollectionView!
    @IBOutlet weak var categories: UILabel!

    override func prepareForReuse() {
        collectionViewTrainer.reloadData()
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

extension trainerCells {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionViewTrainer.delegate = dataSourceDelegate
        collectionViewTrainer.dataSource = dataSourceDelegate
        collectionViewTrainer.tag = row
        collectionViewTrainer.setContentOffset(collectionViewTrainer.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionViewTrainer.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionViewTrainer.contentOffset.x = newValue }
        get { return collectionViewTrainer.contentOffset.x }
    }
}

class trainerCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewTrainer: UICollectionView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 134, height: 192)
        return size
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
    fileprivate func getJSONRequest() {
        Alamofire.request("https://coachy.herokuapp.com/traininers/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar.arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.collectionViewTrainer.reloadData()
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trainerData", for: indexPath as IndexPath) as! trainerCollections
        var dict = arrRes[(indexPath as NSIndexPath).row]
        
        let imageURL = dict["image_url"] as? String
        let url = URL(string: imageURL!)
        cell.trainerProfileImage.kf.setImage(with: url)
        cell.trainerName.text = (dict["first_name"] as? String)! + " " + (dict["last_name"] as? String)!
        cell.trainerSlogan.text = dict["location"] as? String
        cell.trainerRating.image = #imageLiteral(resourceName: "Rating Stars")
        
        return cell
    }
    
    override func numberOfItems(inSection section: Int) -> Int {
        print("Imma cry")
        print(arrRes.count)
        return arrRes.count
    }
    
}


class trainerCollections: UICollectionViewCell {
    
    @IBOutlet weak var trainerProfileImage: UIImageView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var trainerSlogan: UILabel!
    @IBOutlet weak var trainerRating: UIImageView!
    
    
    override func prepareForReuse() {
        trainerProfileImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
}
