//
//  SuggestedNetworkVC.swift
//  Designing
//
//  Created by Jenish on 31/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SuggestedNetworkVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    
    struct SuggestedNetworkCollection {
        
        var profilepicture : String
        var usernamelbl : String
        var indicatorimage : Int
        init(profilepicture:String,usernamelbl : String,indicatorimage : Int) {
            self.profilepicture = profilepicture
            self.usernamelbl = usernamelbl
            self.indicatorimage = indicatorimage
            
        }
    }
    @IBOutlet weak var SuggestedNetworkCollectionView: UICollectionView!
   
    
    var suggestednetworkArray = [
                                  SuggestedNetworkCollection(profilepicture: "user1", usernamelbl: "bindaz", indicatorimage: 0),
                                  SuggestedNetworkCollection(profilepicture: "wav", usernamelbl: "Dads", indicatorimage: 1),
                                  SuggestedNetworkCollection(profilepicture: "vlc", usernamelbl: "Goverments", indicatorimage: 1),
                                  SuggestedNetworkCollection(profilepicture: "png", usernamelbl: "Medical", indicatorimage: 2),
                                  SuggestedNetworkCollection(profilepicture: "jpg", usernamelbl: "Rose Hose", indicatorimage: 2),
                                  SuggestedNetworkCollection(profilepicture: "mp3", usernamelbl: "Tat chats", indicatorimage: 0),
                                  SuggestedNetworkCollection(profilepicture: "mp4", usernamelbl: "sagar", indicatorimage: 0),
                                  SuggestedNetworkCollection(profilepicture: "user1", usernamelbl: "nirav", indicatorimage: 2),
                                  SuggestedNetworkCollection(profilepicture: "wav", usernamelbl: "jack", indicatorimage: 1),
                                  SuggestedNetworkCollection(profilepicture: "user1", usernamelbl: "bindaz", indicatorimage: 0),
                                  SuggestedNetworkCollection(profilepicture: "wav", usernamelbl: "Dads", indicatorimage: 1),
                                  SuggestedNetworkCollection(profilepicture: "vlc", usernamelbl: "Goverments", indicatorimage: 1),
                                  SuggestedNetworkCollection(profilepicture: "png", usernamelbl: "Medical", indicatorimage: 2),
                                  SuggestedNetworkCollection(profilepicture: "jpg", usernamelbl: "Rose Hose", indicatorimage: 2),
                                  SuggestedNetworkCollection(profilepicture: "mp3", usernamelbl: "Tat chats", indicatorimage: 0),
                                  SuggestedNetworkCollection(profilepicture: "mp4", usernamelbl: "sagar", indicatorimage: 0),
                                  SuggestedNetworkCollection(profilepicture: "user1", usernamelbl: "nirav", indicatorimage: 2),
                                  SuggestedNetworkCollection(profilepicture: "wav", usernamelbl: "jack", indicatorimage: 1),

    ]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suggestednetworkArray.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 3
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SuggestionHeaderView", for: indexPath as IndexPath)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestedNetworkCollectionCell", for:
            indexPath as IndexPath) as! SuggestedNetworkCollectionCell
   
        var indicatorimages = ""
        
        if suggestednetworkArray[indexPath.row].indicatorimage == 1{
            
            indicatorimages = "active"
            
        } else if suggestednetworkArray[indexPath.row].indicatorimage == 0{
           
            indicatorimages = "deactive"
            
        }
        
        cell.ProfileImage.image = UIImage(named: suggestednetworkArray[indexPath.row].profilepicture )
        cell.UsernameLbl.text = suggestednetworkArray[indexPath.row].usernamelbl
        cell.IndicatorImage.image = UIImage(named: indicatorimages)
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
