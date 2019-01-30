//
//  NetworksViewController.swift
//  Designing
//
//  Created by Jenish on 19/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit

struct NetworkStructure{
    var Profilepic : String
    var Username : String
    var Expertise : String
    
    
    init(Profilepic:String,Username:String,Expertise:String) {
        self.Profilepic = Profilepic
        self.Username = Username
        self.Expertise = Expertise
        
    }
}
class NetworksViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    
    @IBOutlet weak var AddNetworkBtn: UIButton!
    
 var Network = [NetworkStructure(Profilepic: "user1", Username: "Network1", Expertise: "expertise"),
                NetworkStructure(Profilepic: "user1", Username: "Network2", Expertise: "expertise"),
                NetworkStructure(Profilepic: "user1", Username: "Network3", Expertise: "expertise"),
                NetworkStructure(Profilepic: "user1", Username: "Network4", Expertise: "expertise"),
                NetworkStructure(Profilepic: "user1", Username: "Network5", Expertise: "expertise"),
                NetworkStructure(Profilepic: "user1", Username: "Network6", Expertise: "expertise"),
                NetworkStructure(Profilepic: "user1", Username: "Network7", Expertise: "expertise"),
                
                ]
   
    @IBOutlet weak var NetworkTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.AddNetworkBtn.layer.cornerRadius = self.AddNetworkBtn.frame.height/2
        self.AddNetworkBtn.clipsToBounds = true
        self.AddNetworkBtn.setImage(UIImage(named: "add_icon"), for: .normal)
        self.AddNetworkBtn.imageEdgeInsets = UIEdgeInsets(top: 6,left: 0,bottom: 6,right:40)
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Network.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NetworkCellVC") as! NetworkCellVC
        
        cell.ProfilePicNetwork.image = UIImage(named: Network[indexPath.row].Profilepic)
        cell.UsernameNetworkLbl.text = Network[indexPath.row].Username
        cell.ExpertiseLblNetwork.text = Network[indexPath.row].Expertise
        
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
