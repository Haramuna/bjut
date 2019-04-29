//
//  ViewController.swift
//  bjut
//
//  Created by lucky on 2019/3/12.
//  Copyright © 2019 lucky. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var Open: UIBarButtonItem!
    @IBOutlet weak var table1: UIButton!
    @IBOutlet weak var table2: UIButton!
    @IBOutlet weak var table3: UIButton!
    @IBOutlet weak var table4: UIButton!
    @IBOutlet weak var table5: UIButton!
    
    
    var tableName = [[String:String]()]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        table1.addTarget(self, action: #selector(jumpPage1), for: .touchUpInside)
       
        
        Open.target = self.revealViewController()
        Open.action = #selector(SWRevealViewController.revealToggle(_:))

//        tableCell.dataSource = self
//        tableCell.delegate = self
//
//        tableName = [["name":"研究生课堂教学质量评价表"],["name":"研究生考试试卷规范性评价表"],["name":"研究生培养环节质量评价表-开题报告"],["name":"研究生培养环节质量评价表-中期考核"],["name":"研究生学位论文答辩情况评价表"]]
    }

    
    func ceshi()  {
        let par:Parameters = ["department":"信息学部"]
        request("http://117.121.38.95:9817/mobile/form/coursedata/getcourse.ht", method: .post,parameters:par).responseData{
            //            .validate()
            res in
                debugPrint(res)
        }
    }
    
//    func getHeader() -> HTTPHeaders {
//        var header: HTTPHeaders = [:]
//        let url = URL(string: "http://117.121.38.95:9817")!
//        var cstorage = HTTPCookieStorage.shared
//        if var cookies = cstorage.cookies(for: url) {
//            for cookie:HTTPCookie in cookies{
//                let Cookie = cookie.value as String
//                header.add(name: "Cookie", value: Cookie)
//                print("name:\(cookie.name)  value:\(cookie.value)")
//            }
//        }
//        return header
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellId = "table"
//        let cell = tableCell.dequeueReusableCell(withIdentifier: cellId)
//        let dict:Dictionary = tableName[indexPath.row]
//        cell?.textLabel?.text = dict["name"]
////        cell?.textLabel?.isUserInteractionEnabled = true
////        let gesture = UITapGestureRecognizer(target: self, action: #selector(tableOne))
////        cell?.textLabel?.addGestureRecognizer(gesture)
//        tableCell.tableFooterView = UIView()
//        return cell!
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let newView = table1View()
////        self.navigationController?.pushViewController(newView, animated: true)
////        debugPrint(indexPath.row)
//        switch indexPath.row {
//        case 0:
//            self.performSegue(withIdentifier: "page1", sender: self)
//        default:
//            print("ddd")
//        }
//    }
    
    
}

