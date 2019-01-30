//
//  NoticeParentVC.swift
//  Designing
//
//  Created by Jenish on 18/01/19.
//  Copyright © 2019 Jenish. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class NoticeParentVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // change selected bar color
        settings.style.buttonBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.gray
        settings.style.selectedBarBackgroundColor = UIColor.black
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor.black
            newCell?.label.textColor = UIColor.white
        }
        super.viewDidLoad()
        self.title = "Notices"
        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MainViewController")
         let child2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MenterRequestViewController")
        return [child1,child2]
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
