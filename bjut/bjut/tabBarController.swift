//
//  tabBarController.swift
//  bjut
//
//  Created by lucky on 2019/4/9.
//  Copyright © 2019 lucky. All rights reserved.
//

import UIKit

class tabBarController: UITabBarController {
    @IBAction func More(_ sender: Any) {
        setMenuOne()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //设置下拉菜单
    func setMenuOne() {
        let menuArray = [KxMenuItem.init("预览全表",image:UIImage(named: "edit-find"),target:self, action:#selector(clickOne(sender:))),KxMenuItem.init("草稿箱",image:UIImage(named: "save"),target:self,action:#selector(clickTwo(sender:))),KxMenuItem.init("退出编辑",image:UIImage(named: "exit"),target:self, action:#selector(clickThree(sender:)))]
        let a  = CGRect(x:self.view.frame.width-27,y:70,width:0,height:0)
        let options = OptionalConfiguration(arrowSize: 9,  //指示箭头大小
            marginXSpacing: 7,  //MenuItem左右边距
            marginYSpacing: 10,  //MenuItem上下边距
            intervalSpacing: 10,  //MenuItemImage与MenuItemTitle的间距
            menuCornerRadius: 6.5,  //菜单圆角半径
            maskToBackground: true,  //是否添加覆盖在原View上的半透明遮罩
            shadowOfMenu: false,  //是否添加菜单阴影
            hasSeperatorLine: true,  //是否设置分割线
            seperatorLineHasInsets: false,  //是否在分割线两侧留下Insets
            textColor: Color(R: 0, G: 0, B: 0),  //menuItem字体颜色
            menuBackgroundColor: Color(R: 1, G: 1, B: 1)  //菜单的底色
        )
        
        KxMenu.show(in: self.view, from: a, menuItems: menuArray, withOptions: options)
    }
    
    //预览全表
    @objc func clickOne(sender:AnyObject){
        print(sender)
    }
    //保存草稿
    @objc func clickTwo(sender:AnyObject){
        print(sender)
    }
    //退出编辑
    @objc func clickThree(sender:AnyObject){
        print(sender)
    }
}
