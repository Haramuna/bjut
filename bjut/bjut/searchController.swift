//
//  searchController.swift
//  bjut
//
//  Created by apple on 2019/4/25.
//  Copyright © 2019年 lucky. All rights reserved.
//

import Foundation
import UIKit


class searchController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{
    
    
    @IBOutlet weak var tbView: UITableView!
    
    let str = ["研究生课堂教学质量评价表","研究生考试试卷规范性评价表","研究生培养环节质量评价表-开题报告","研究生培养环节质量评价表-中期考核","研究生学位论文答辩情况评价表"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customView = UIView()
        let cellId = "cellSearchIndex"
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        cell.textLabel?.text = str[indexPath.row]
//        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(jumpSearchOne(sender: ))))
        cell.textLabel?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.6, height: cell.frame.height)
        cell.textLabel?.numberOfLines = 0
        
        let rect = CGRect(x:cell.frame.width-170,y:9,width:170,height:30)
        customView.frame = rect
        //        customView.addSubview(point_1)
        cell.addSubview(customView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "jumpSearchOneSegue", sender: self)
            break
        default:
            print("error")
        }
    }
    
//    @objc func jumpSearchOne(sender: UITapGestureRecognizer){
//       // if indexpath==0 {
//            self.performSegue(withIdentifier: "jumpSearchOneSegue", sender: self)}
//   // }
    
}
