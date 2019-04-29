//
//  tbOnePageTwoController.swift
//  bjut
//
//  Created by lucky on 2019/4/12.
//  Copyright © 2019 lucky. All rights reserved.
//

import UIKit

class tbOnePageTwoController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tbView: UITableView!
    
    var totalPoint = UILabel.init()
    
//    var point_1 = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
    
    let str = ["教学常规","1.提前上课，按时上下课，严格课堂管理","教育思想","2.治学严谨，教学观点正确，严格执行教学安排，言论健康遵守课堂教学规范","3.强调研究型学习，注重学生质疑、发现、提出和分析解决问题等创新能力的培养","教育内容","4.内容新颖，注重基础性与前沿性，融知识传授、能力培养和素质教育为一体","5.掌握学科国内外的研究动态，能及时把学科领域最新成果和经典案例引入教学过程","教育方法","6.启发式、讨论式、案例式等多种讲授方式与文献研讨相结合，注重自学能力培养","7.理论联系实际，条理清楚、层次分明、重点突出，激发思维，注重师生互动","教育手段","8.教学手段恰当，讲解生动，语言清晰，不照本宣科，文字规范，板书工整","教育效果","9.充分激发学生的学习热情，学生参与度高，课堂气氛活跃，效果良好"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return 0
        }else{
            return str.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleView = UIView()
        let titleLabel = UILabel()
        let titleLabel1 = UILabel()
        titleView.frame = CGRect(x:0,y:60,width:100,height:20)
        
        
        if (section == 0){
            titleLabel.text = "评分信息"
            titleLabel.center = CGPoint(x: (self.view.frame.width - 80)/2, y: 10)
            titleLabel.sizeToFit()
            titleView.addSubview(titleLabel)
            return titleView
            
        }else{
            titleView.backgroundColor = UIColor.gray
            
            titleLabel.text = "总分"
            titleLabel.textColor = UIColor.red
            titleLabel.center = CGPoint(x:20,y:10)
            
            titleLabel1.text = "分"
            titleLabel1.textColor = UIColor.red
            titleLabel1.frame = CGRect(x: self.view.frame.width - 40, y: 10, width: 20, height: 20)
            
            totalPoint.text = "100.0"
            totalPoint.textColor = UIColor.white
            totalPoint.backgroundColor = UIColor.black
            totalPoint.frame = CGRect(x: (self.view.frame.width - 60)/2, y: 10, width: 60, height: 20)
            
            titleLabel.sizeToFit()
            titleLabel1.sizeToFit()
            totalPoint.sizeToFit()
            titleView.addSubview(titleLabel)
            titleView.addSubview(titleLabel1)
            titleView.addSubview(totalPoint)
            
            return titleView
        }
     
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customView = UIView()
        let cellId = "cellOne"
 
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        cell.textLabel?.text = str[indexPath.row]
        cell.textLabel?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.6, height: cell.frame.height)
        cell.textLabel?.numberOfLines = 0
        
        
        
        let rect = CGRect(x:cell.frame.width-170,y:9,width:170,height:30)
        customView.frame = rect
//        customView.addSubview(point_1)
        cell.addSubview(customView)
        return cell
        
    
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(1)
        tbView.delegate = self
        tbView.dataSource = self
        
//        point_1.backgroundColor = UIColor.blue
    }
    
}
