//
//  MainViewController.swift
//  Designing
//
//  Created by Jenish on 18/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
import XLPagerTabStrip
struct MainRequest{
    var Profilepic : String
    var Username : String
    var Date : String
    var AnswerRequest : String
    var Question : String
    
    init(Profilepic:String,Username:String,Date:String,AnswerRequest:String,Question:String) {
        self.Profilepic = Profilepic
        self.Username = Username
        self.Date = Date
        self.AnswerRequest = AnswerRequest
        self.Question = Question
        
    }
}

class MainViewController: UIViewController,IndicatorInfoProvider,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var MainViewTableView: UITableView!
    var MainDeatil = [
        MainRequest(Profilepic: "user1", Username: "udit prasad", Date: "sep,4 2017", AnswerRequest: "Request Your Answer", Question: "what are some interseting startup in india?"),
        MainRequest(Profilepic: "user1", Username: "Abhay Pratap", Date: "sep,4 2017", AnswerRequest: "Request Your Answer", Question: "what are some interseting startup in india?"),
        MainRequest(Profilepic: "user1", Username: "Roshan", Date: "sep,4 2017", AnswerRequest: "Request Your Answer", Question: "what are some interseting startup in india?"),
        MainRequest(Profilepic: "user1", Username: "udit prasad", Date: "sep,4 2017", AnswerRequest: "Request Your Answer", Question: "what are some interseting startup in india?"),
        MainRequest(Profilepic: "user1", Username: "Abhay Pratap", Date: "sep,4 2017", AnswerRequest: "Request Your Answer", Question: "what are some interseting startup in india?"),
        MainRequest(Profilepic: "user1", Username: "Roshan", Date: "sep,4 2017", AnswerRequest: "Request Your Answer", Question: "what are some interseting startup in india? what are some interseting startup in india? "),]

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Main")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MainViewTableView.rowHeight = UITableView.automaticDimension
        MainViewTableView.estimatedRowHeight = 330
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainDeatil.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainVCTableViewCell") as? MainVCTableViewCell else { return UITableViewCell() }
        cell.ProfilePicture.image = UIImage(named: MainDeatil[indexPath.row].Profilepic)
        cell.UsernameLbl.text = MainDeatil[indexPath.row].Username
        cell.DateLbl.text = MainDeatil[indexPath.row].Date
        cell.RequestansLbl.text = MainDeatil[indexPath.row].AnswerRequest
        cell.QuestionLbl.text = MainDeatil[indexPath.row].Question
    
        
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
