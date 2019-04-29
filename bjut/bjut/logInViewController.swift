//
//  mainPageController.swift
//  bjut
//
//  Created by lucky on 2019/3/29.
//  Copyright © 2019 lucky. All rights reserved.
//

import SwiftyJSON
import Alamofire


class logInViewController:ViewController{
    
    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func login(_ sender: UIButton) {
        
        Login()
        
    }
    
    override func viewDidLoad() {
        
        //        Login()
        
    }
    
    func getLogInfo() -> Parameters {
        var params:Parameters = [:] as [String:Any]
        var flag = true
        
        while flag {
            if userId.text != nil{
                params["username"] = userId.text
            }
            if password.text != nil{
                params["password"] = password.text
            }
            if userId.text != nil && password.text != nil{
                params["lang"] = 1
                flag = false
            }
        }
        return params
    }
    
    func Login (){
        
//                var params:Parameters = [:] as [String:Any]
        //        params = getLogInfo()
        var params:Parameters = ["username":"admin","password":12,"lang":1] as [String:Any]
        
        request("http://117.121.38.95:9817/mobile/system/mobileLogin.ht",method: .post, parameters: params).responseData{
            response in
            var resData:NSString = ""
            var newStr:NSString = ""
            do{
                resData = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!
                
                newStr = resData.substring(with: NSMakeRange(1, resData.length-2)) as NSString
                let newData = newStr.data(using: String.Encoding.utf8.rawValue)
                
                let body = JSON(newData)
//                debugPrint(body["success"])
//                print(body["success"].bool)
                if body["success"].bool! {
                    //                    print("success")
                    self.performSegue(withIdentifier: "login", sender: self)
                }else{
                    //                    print("fail")
                    self.alertWarning(title: "提示", msg: "登陆失败，请检查用户名及密码")
                }
            }
            catch{
                print(error)
            }
            
        }
        
    }
    
    //弹出警告窗
    func alertWarning(title:String,msg:String) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "确定", style: .default)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

