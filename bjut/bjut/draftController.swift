//
//  draft.swift
//  bjut
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 lucky. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class draftController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var draftView: UITableView!
   // var allDraftArray = [Any]()
//    @IBOutlet weak var draftView: UITableView!
    let numberOfIndex = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("begin")
        
        draftView.delegate = self
        draftView.dataSource = self
        
    }

   
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                          self.tableView!.deselectRow(at: indexPath, animated: true)
//                       // let itemString = self.ctrlnames[indexPath.row]
//
//                        self.performSegue(withIdentifier: "ShowDetailView", sender: self)
//                }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "ShowDetailView", sender: self)
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        //print("1")
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let buff = numberOfIndex.value(forKey: "draftNumber") as! Int
        return buff
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?{
        return "删除"
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            //allDraftArray.remove(at: indexPath.row)
            print("11111111111111")
            //print(allDraftArray.count)
            //刷新tableview
            //tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var allDraftArray = [Any]()
        let customView = UIView()
        let cellId = "caoGao"
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        
        let rect = CGRect(x:cell.frame.width-170,y:9,width:170,height:30)
        
        
//        draftView.tableFooterView = UIView()
        request("http://117.121.38.95:9817/mobile/form/buff/get.ht", method: .post).responseData{
            res in
            let body = self.dealData(res: res)
            for i in 0...body["FormBuff"].count{
                allDraftArray.append(body["FormBuff"][i])}
            print("22222222222")
            cell.textLabel?.text = body["FormBuff"][indexPath.row]["topic1"].stringValue
            cell.detailTextLabel?.text = body["FormBuff"][indexPath.row]["formid"].stringValue
            //cell.textLabel?.text = "1"
//            print(allDraftArray)
//            print(allDraftArray.count)
            customView.frame = rect
            cell.addSubview(customView)
            
            }
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(jumpTableOne(sender:))))
        return cell
    }

    @objc func jumpTableOne(sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "jumpTableOneSegue", sender: self)
    }
    
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
