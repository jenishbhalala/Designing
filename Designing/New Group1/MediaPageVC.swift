//
//  MediaPageVC.swift
//  Designing
//
//  Created by Jenish on 31/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
struct MediaPageCollection {
    
    var image : String
    var typelbl : String
    init(image:String,typelbl : String) {
        self.image = image
        self.typelbl = typelbl
        
    }
}
class MediaPageVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    
    var MediaPageCollections = [
        MediaPageCollection(image: "wav",typelbl:".wav"),
        MediaPageCollection(image: "vlc",typelbl:".vlc"),
        MediaPageCollection(image: "png",typelbl:".png"),
        MediaPageCollection(image: "jpg",typelbl:".jpeg"),
        MediaPageCollection(image: "mp3",typelbl:".mp3"),
        MediaPageCollection(image: "mp4",typelbl:".mp4"),      
        
        ]

    @IBOutlet weak var DownloadBtn: UIButton!
    @IBOutlet weak var UploadBtn: UIButton!
    @IBOutlet weak var MediaPageCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DownloadBtn.layer.cornerRadius = self.DownloadBtn.frame.height/2
        self.DownloadBtn.clipsToBounds = true
        self.DownloadBtn.layer.borderWidth = 1
        self.DownloadBtn.layer.borderColor = UIColor.black.cgColor
        self.UploadBtn.layer.cornerRadius = self.UploadBtn.frame.height/2
        self.UploadBtn.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MediaPageCollections.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaPagecollectionCell", for:
            indexPath as IndexPath) as! MediaPagecollectionCell
        cell.MediaTypeLbl.text = MediaPageCollections[indexPath.row].typelbl
        cell.MediaPageImageView.image = UIImage(named: MediaPageCollections[indexPath.row].image)

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
