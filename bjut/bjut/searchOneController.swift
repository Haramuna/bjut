//
//  searchOneController.swift
//  bjut
//
//  Created by apple on 2019/4/25.
//  Copyright © 2019年 lucky. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class searchOneController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var tbView: UITableView!
    let numberOfIndex = UserDefaults.standard
    
    var params:Parameters = [:] as [ String : Any]
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.delegate = self
        tbView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //print("1")
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let buff = numberOfIndex.value(forKey: "searchNumber") as! Int
        return buff
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var allDraftArray = [Any]()
        let customView = UIView()
        let cellId = "caoGao"
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        
        let rect = CGRect(x:cell.frame.width-170,y:9,width:170,height:30)
        
        
        //        draftView.tableFooterView = UIView()
        request("http://117.121.38.95:9817/mobile/form/jxzl/userlist.ht", method: .post).responseData{
            res in
            let body = self.dealData(res: res)
            for i in 0...body["JxzlInfo"].count{
                allDraftArray.append(body["JxzlInfo"][i])}
            cell.textLabel?.text = body["JxzlInfo"][indexPath.row]["classid"].stringValue
            cell.detailTextLabel?.text = body["JxzlInfo"][indexPath.row]["id"].stringValue
            customView.frame = rect
            cell.addSubview(customView)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showSearchPreviewPage", sender: self)
        request("http://117.121.38.95:9817/mobile/form/jxzl/userlist.ht", method: .post).responseData{
            res in
            let body = self.dealData(res: res)
            //print(body["JxzlInfo"][indexPath.row]["classid"].stringValue)
            self.params["id"] = body["JxzlInfo"][indexPath.row]["id"].stringValue
            request("http://117.121.38.95:9817/mobile/form/jxzl/get.ht", method: .post, parameters:self.params).responseData{
                res in
                let body0 = self.dealData(res: res)
                //print(body0["JxzlInfoPlus"]["comment"])
                //var buff = [String:Any]()
                
                var buffbasicinfo = [String:Any]()
                buffbasicinfo["departText"] = body0["JxzlInfo"]["department"].stringValue
                buffbasicinfo["courseText"] = body0["JxzlInfo"]["course"].stringValue
                buffbasicinfo["classText"] = body0["JxzlInfo"]["course"].stringValue
                buffbasicinfo["teacherText"] = body0["JxzlInfo"]["teacher"].stringValue
                buffbasicinfo["classroomText"] = body0["JxzlInfo"]["room"].stringValue
                buffbasicinfo["dateText"] = body0["JxzlInfo"]["time1"].stringValue
                self.defaults.set(buffbasicinfo, forKey: "basicInfo")

                var buffketanginfo = [String:Any]()
                buffketanginfo["shidao"] = body0["JxzlInfo"]["presentnumber"].stringValue
                buffketanginfo["chidao"] = body0["JxzlInfo"]["latenumber"].stringValue
                buffketanginfo["shouke"] = body0["JxzlInfo"]["topic"].stringValue
                buffketanginfo["tingke"] = body0["JxzlInfo"]["listentime"].stringValue
                self.defaults.set(buffketanginfo, forKey: "ketangInfo")

                var buffpingfenInfo = [String:Any]()
                buffpingfenInfo["point_1"] = body0["JxzlInfoPlus"]["score1"].stringValue
                buffpingfenInfo["point_2"] = body0["JxzlInfoPlus"]["score2"].stringValue
                buffpingfenInfo["point_3"] = body0["JxzlInfoPlus"]["score3"].stringValue
                buffpingfenInfo["point_4"] = body0["JxzlInfoPlus"]["score4"].stringValue
                buffpingfenInfo["point_5"] = body0["JxzlInfoPlus"]["score5"].stringValue
                buffpingfenInfo["point_6"] = body0["JxzlInfoPlus"]["score6"].stringValue
                buffpingfenInfo["point_7"] = body0["JxzlInfoPlus"]["score7"].stringValue
                buffpingfenInfo["point_8"] = body0["JxzlInfoPlus"]["score8"].stringValue
                buffpingfenInfo["point_9"] = body0["JxzlInfoPlus"]["score9"].stringValue
                self.defaults.set(buffpingfenInfo, forKey: "pingfenInfo")

                var buffpingyuInfo = [String:Any]()
//                var str:String
//                str = body0["JxzlInfoPlus"]["id"].stringValue
                buffpingyuInfo["pingyu"] = body0["JxzlInfoPlus"]["comment"].stringValue
//                defaults.set(buffpingyuInfo, forKey: "pingyuInfo")
//                print(buffpingyuInfo)
                
                //debugPrint(buffpingyuInfo)
                self.defaults.set(buffpingyuInfo, forKey: "pingyuInfo")
                //debugPrint(self.defaults.value(forKey: "pingyuInfo"))
                //print(buff)
                
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showSearchPreviewPage"{
//            let controller = segue.destination as! searchOnePreview
//            controller.itemString = sender as? String
//            print(sender)
//        }
//    }
    
    func dealData(res:DataResponse<Data>) -> JSON {
        
        var resData:NSString = ""
        var newStr:NSString = ""
        var arrayData = [Any]()
        var body:JSON
        do{
            resData = NSString(data: res.data!, encoding: String.Encoding.utf8.rawValue)!
            
            newStr = resData.substring(with: NSMakeRange(1, resData.length-2)) as NSString
            let newData = newStr.data(using: String.Encoding.utf8.rawValue)
            body = JSON(newData)
        }catch{
            print(error)
        }
        return body
    }
    
    
}
