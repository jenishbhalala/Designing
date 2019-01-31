//
//  SuggestedSearchVC.swift
//  Designing
//
//  Created by Jenish on 31/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

class SuggestedSearchVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate  {
   
    
    

    @IBOutlet weak var SuggestedSearchCollection: UICollectionView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var SuggestionSearchArray = [SuggestedSearchCollectionarray]()
    
    var currentfilterArray = [SuggestedSearchCollectionarray]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUsers()
        setUpSearchBar()
        
  
    }
  
    private func setUpUsers(){
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "bindaz"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "Dads"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "goverments"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "Medical"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "Rose hose"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "tat chats"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "jack"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "nirav"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "sagar"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "alpesh"))
          SuggestionSearchArray.append(SuggestedSearchCollectionarray(profilepicture: "user1", usernamelbl: "hardik"))
        
   currentfilterArray = SuggestionSearchArray
    }
    
    private func setUpSearchBar(){
        SearchBar.delegate = self

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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentfilterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SuggestedSearchCollectionCell", for:indexPath as IndexPath) as! SuggestedSearchCollectionCell
        cell.SuggestedSearchimages.image = UIImage(named: currentfilterArray[indexPath.row].profilepicture)
        cell.UsernameSearchLbl.text = currentfilterArray [indexPath.row].usernamelbl
   
        
    return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentfilterArray =  SuggestionSearchArray
            SuggestedSearchCollection.reloadData()
            return
            
        }
        currentfilterArray = SuggestionSearchArray.filter({ username -> Bool in
        
           // guard let users = searchBar.text else {return  false}
            username.usernamelbl.lowercased().contains(searchText.lowercased())
            
        })
        SuggestedSearchCollection.reloadData()
    }
    
    
}
class SuggestedSearchCollectionarray {
    
    let profilepicture : String
    let usernamelbl : String
    
    init(profilepicture:String,usernamelbl : String) {
        self.profilepicture = profilepicture
        self.usernamelbl = usernamelbl
        
        
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
