//
//  testdefault.swift
//  bjut
//
//  Created by apple on 2019/4/28.
//  Copyright © 2019年 lucky. All rights reserved.
//

import Foundation

class testdefault:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
    
    let basicInfos = UserDefaults.standard
    func test(){
        let buff = basicInfos.value(forKey: "ketangInfo") as! [String:Any]
        print(buff)
    }
}
