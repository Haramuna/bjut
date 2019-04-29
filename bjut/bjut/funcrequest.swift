//
//  funcrequest.swift
//  bjut
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019年 lucky. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class funcrequest{
    
    func funcrequestdraftnum() -> Int{
        var allDraftArray = [Any]()
        
        request("http://117.121.38.95:9817/mobile/form/buff/get.ht", method: .post).responseData{
            res in
            let body = self.dealData(res: res)
            for i in 0...body["FormBuff"].count{
                allDraftArray.append(body["FormBuff"][i])}
            
        }
        return allDraftArray.count
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
