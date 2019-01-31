//
//  UserDetailVC.swift
//  Designing
//
//  Created by Jenish on 21/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
struct collection {
    
    var image : String
    var detaillbl : String
    init(image:String,detaillbl : String) {
        self.image = image
        self.detaillbl = detaillbl
        
    }
}
class UserDetailVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    var collections = [
        collection(image: "notice_icon",detaillbl:"Notices"),
        collection(image: "progress_icon",detaillbl:"Progress"),
        collection(image: "Network_icon",detaillbl:"Networks"),
        collection(image: "Notices_icon",detaillbl:"Suggested Search"),
        collection(image: "Media_icon",detaillbl:"Media"),
        collection(image: "FindaMentor_icon",detaillbl:"Find a Mentor"),]

    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(gesture(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.delegate = self
        CollectionView?.addGestureRecognizer(tap)
        
        
       
        // Do any additional setup after loading the view.
    }
//    let columnLayout = FlowLayout(
//        cellsPerRow: 3,
//        minimumInteritemSpacing: 10,
//        minimumLineSpacing: 10,
//        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    )
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 3
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: 125)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath as IndexPath)
        return headerView
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserDetailCellVC", for:
            indexPath as IndexPath) as! UserDetailCellVC
        if indexPath.row % 2 == 0
        {
            cell.contentView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            cell.backgroundColor = cell.contentView.backgroundColor
            
        }
        

        
        cell.DetailImages.image = UIImage(named: collections[indexPath.row].image)
        cell.Detaillbl.text = collections[indexPath.row].detaillbl
    return cell
    }
    
    @IBAction func gesture(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: CollectionView)
        if let indexPath = CollectionView?.indexPathForItem(at: point) {
            //print(collections[indexPath.row])
       
           if indexPath.row == 0
           {
               print("notice print")
            
           } else if indexPath.row == 1{
            
            
              print("progress print")
            }
        else if indexPath.row == 2{
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "SuggestedNetworkVC") as! SuggestedNetworkVC
            self.navigationController?.pushViewController(controller, animated: true)
            
            print("network print")
            }
        else if indexPath.row == 3{
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "SuggestedSearchVC") as! SuggestedSearchVC
            self.navigationController?.pushViewController(controller, animated: true)
            
            print("notices print")
            }
        else if indexPath.row == 4{
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "MediaPageVC") as! MediaPageVC
            self.navigationController?.pushViewController(controller, animated: true)
            print("Media print")
            }
        else if indexPath.row == 5{
            
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "MApViewVC") as! MApViewVC
            self.navigationController?.pushViewController(controller, animated: true)
          //  print("Find a mentor print")
            }
        
        }
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
extension UserDetailVC: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let point = touch.location(in: CollectionView)
        if let indexPath = CollectionView?.indexPathForItem(at: point),
            let cell = CollectionView?.cellForItem(at: indexPath) {
            return touch.location(in: cell).y > 5
        }
        
        return false
    }
}
