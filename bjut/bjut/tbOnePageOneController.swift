//
//  tbOnePageOneController.swift
//  bjut
//
//  Created by lucky on 2019/4/9.
//  Copyright © 2019 lucky. All rights reserved.
//

import UIKit

class tbOnePageOneController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var tbView: UITableView!
    
    let yingdaorenshu = UITextField(frame: CGRect(x:0,y:0,width:170,height:30))
    let shidaorenshu = UITextField(frame: CGRect(x:0,y:0,width:170,height:30))
    let chidaorenshu = UITextField(frame: CGRect(x:0,y:0,width:170,height:30))
    let shoukezhuanti = UITextField(frame: CGRect(x:0,y:0,width:170,height:30))
    let tingkejieci = UITextField(frame: CGRect(x:0,y:0,width:170,height:30))
    
    
    let ketangInfo = ["应到人数：","实到人数：","迟到人数：","授课专题：","听课节次："]
    let placeChar = ["请填写实际到课人数","请填写迟到人数","请填写授课专题","请填写听课节次"]
    
 
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        yingdaorenshu.isUserInteractionEnabled = false
        return false
    }
    
    //cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //section数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回分区头部视图，section
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.gray
        let titleLabel = UILabel()
        titleLabel.text = "课堂信息"
//        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.center = CGPoint(x:(self.view.frame.width - 80)/2,y:10)
//        titleLabel.frame = CGRect(x: tableView.frame.width/2, y: 10, width: 100, height: 20)
        
        titleLabel.sizeToFit()
        headerView.addSubview(titleLabel)
        return headerView
    }
    
    //返回分区头部视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //初始化每个cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customView = UIView()
        
        
        let cellIdentify = "keTang"
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentify)
        let rect = CGRect(x:cell.frame.width-170,y:9,width:170,height:30)

        cell.textLabel!.text = ketangInfo[indexPath.row]
        
//        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)

//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath)
        customView.frame = rect
//        customView.backgroundColor = UIColor.red
        cell.addSubview(customView)
//        yingdaorenshu.frame = CGRect(x:0,y:0,width:170,height:30)
        
        
        
        switch indexPath.row {
        case 0:
            yingdaorenshu.text = "100"
            yingdaorenshu.tintColor = UIColor.clear
            textFieldShouldBeginEditing(yingdaorenshu)
            customView.addSubview(yingdaorenshu)
        case 1:
            customView.addSubview(shidaorenshu)
        case 2:
//            chidaorenshu.placeholder = placeChar[2]
            customView.addSubview(chidaorenshu)
        case 3:
//            shoukezhuanti.placeholder = placeChar[3]
            customView.addSubview(shoukezhuanti)
        case 4:
//            tingkejieci.placeholder = placeChar[4]
            customView.addSubview(tingkejieci)
        default:
            break
        }
        
        tbView.tableFooterView = UIView()
 
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //文本框占位符
        shidaorenshu.placeholder = "请填写实到人数"
        chidaorenshu.placeholder = "请填写迟到人数"
        shoukezhuanti.placeholder = "请填写授课专题"
        tingkejieci.placeholder = "请填写听课节次"
        
        //设置键盘类型
        shidaorenshu.keyboardType = UIKeyboardType.numberPad
        chidaorenshu.keyboardType = UIKeyboardType.numberPad
        
        tbView.delegate = self
        tbView.dataSource = self
        
        //注册点击事件
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(handleTap(sender:))))
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            print("收回键盘")
            shidaorenshu.resignFirstResponder()
            chidaorenshu.resignFirstResponder()
            shoukezhuanti.resignFirstResponder()
            tingkejieci.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }

    
}
