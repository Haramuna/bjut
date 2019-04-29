//
//  sideMenu.swift
//  bjut
//
//  Created by apple on 2019/4/22.
//  Copyright © 2019年 lucky. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class sideMenuController: UIViewController {
    
//    @IBAction func showDraft(_ sender: Any) {
//        self.performSegue(withIdentifier: "showDraft", sender: self)
//
//    }
    var defaults = UserDefaults.standard
    
    @IBAction func showDraft(_ sender: Any) {
        
    }
    func showNumberOfIndex(){
        request("http://117.121.38.95:9817/mobile/form/buff/get.ht", method: .post).responseData{
            res in
            let bodyDraft = self.dealData(res: res)
            var draftNumber = bodyDraft["FormBuff"].count
            self.defaults.set(draftNumber, forKey: "draftNumber")
        }
        request("http://117.121.38.95:9817/mobile/form/jxzl/userlist.ht", method: .post).responseData{
            res in
            let bodySearch = self.dealData(res: res)
            var searchNumber = bodySearch["JxzlInfo"].count
            self.defaults.set(searchNumber, forKey: "searchNumber")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumberOfIndex()
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
