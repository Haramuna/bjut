//
//  EvaluateTable.swift
//  bjut
//
//  Created by lucky on 2019/3/29.
//  Copyright © 2019 lucky. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class tableOneView:UIViewController,UITextViewDelegate,UITextFieldDelegate {
    
    
    @IBOutlet weak var departText: UITextField!
    @IBOutlet weak var courseText: UITextField!
    @IBOutlet weak var classText: UITextField!
    @IBOutlet weak var teacherText: UITextField!
    @IBOutlet weak var classroomText: UITextField!
    @IBOutlet weak var dateText: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getInfo()
        departText.delegate = self
        courseText.delegate = self
        
        departText.tintColor = UIColor.clear    //消除光标
        courseText.tintColor = UIColor.clear
        classText.tintColor = UIColor.clear
        teacherText.tintColor = UIColor.clear
        classroomText.tintColor = UIColor.clear
        dateText.tintColor = UIColor.clear
        
        departText.placeholder = "选择学院"
        courseText.placeholder = "选择课程"
        classText.placeholder = "班级信息"
        teacherText.placeholder = "教师姓名"
        classroomText.placeholder = "教室信息"
        
        dateText.layer.borderColor = UIColor.lightGray.cgColor
        dateText.layer.cornerRadius = 10
        dateText.layer.borderWidth = 0.5
//
//        departText.addTarget(self, action: #selector(departentInfo), for: .allEditingEvents)
//        courseText.addTarget(self, action: #selector(courseInfo), for: .allEditingEvents)
        

    }
    //获取学院信息、课程信息
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        departText.addTarget(self, action: #selector(departentInfo), for: .allEditingEvents)
        courseText.addTarget(self, action: #selector(courseInfo), for: .allEditingEvents)

        return true
    }
    
    //隐藏触摸后的键盘
    func textFieldDidBeginEditing(_ textField: UITextField) {
        departText.resignFirstResponder()
        courseText.resignFirstResponder()
    }
    
    @objc func departentInfo() {
        var departArray = [Any]()
        //get department
        request("http://117.121.38.95:9817/mobile/form/coursedata/getdep.ht", method: .post).responseData{
            res in
            let body = self.dealData(res: res)
            for var i in 0...body.count{
                departArray.append(body["coursedata"][i]["department"].string)
            }
            self.pickContent(arrayData: departArray,textFiled: self.departText)
 
        }
            
    }
    
    
    @objc func courseInfo() {
        var params:Parameters = [:] as [ String : Any]
        var parId :Parameters = [:] as [String : Any]
        var courseArray = [Any]()
        var idArray = [Any]()
        var dict = Dictionary<String, Any>()
        params["department"] = self.departText.text
        request("http://117.121.38.95:9817/mobile/form/coursedata/getcourse.ht", method: .post, parameters: params).responseData{
            response in
            //                debugPrint(response)
            let body = self.dealData(res: response)
            for var i in 0...body["coursedata"].count-1{
                courseArray.append(body["coursedata"][i]["course"].stringValue)
                idArray.append(body["coursedata"][i]["id"].intValue)
            }
//            print(courseArray)
//            print(idArray)
//            self.pickContent(arrayData: courseArray, textFiled: self.courseText)
            RPicker.selectOption(dataArray: courseArray as! Array<String>){
                (selectedText,atIndex) in
                self.courseText.text = selectedText
                parId["id"] = idArray[atIndex]
                request("http://117.121.38.95:9817/mobile/form/coursedata/get.ht", method: .post, parameters: parId).responseData{
                    res in
                    let courseBody = self.dealData(res: res)
                    debugPrint(courseBody)
                    self.classText.text = courseBody["coursedata"]["course"].stringValue
                    self.teacherText.text = courseBody["coursedata"]["teacher"].stringValue
                    self.classroomText.text = courseBody["coursedata"]["room"].stringValue
                    self.dateText.text = courseBody["coursedata"]["time1"].stringValue
                    
                }
            }
        }
    }
    
    //
    
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
        //print(1233445667890987654)
        print(body)
        return body
    }
    
    func pickContent(arrayData:Array<Any>,textFiled:UITextField) {
        RPicker.selectOption(dataArray: arrayData as! Array<String>){
            (selectedText,atIndex) in
            textFiled.text = selectedText
            print(selectedText)
            print(atIndex)
        }
    }

}
    

    

