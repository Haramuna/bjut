//
//  searchOnePreview.swift
//  bjut
//
//  Created by apple on 2019/4/26.
//  Copyright © 2019年 lucky. All rights reserved.
//

import Foundation
import Alamofire

class searchOnePreview:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var previewTable: UITableView!
    
    let headerStr = ["基本信息","课堂信息","评分信息","专家评语"]
    let testStr = ["1","2","3","4","5","6","7","8","9","10"]
    let str = ["教学常规","1.提前上课，按时上下课，严格课堂管理","教育思想","2.治学严谨，教学观点正确，严格执行教学安排，言论健康遵守课堂教学规范","3.强调研究型学习，注重学生质疑、发现、提出和分析解决问题等创新能力的培养","教育内容","4.内容新颖，注重基础性与前沿性，融知识传授、能力培养和素质教育为一体","5.掌握学科国内外的研究动态，能及时把学科领域最新成果和经典案例引入教学过程","教育方法","6.启发式、讨论式、案例式等多种讲授方式与文献研讨相结合，注重自学能力培养","7.理论联系实际，条理清楚、层次分明、重点突出，激发思维，注重师生互动","教育手段","8.教学手段恰当，讲解生动，语言清晰，不照本宣科，文字规范，板书工整","教育效果","9.充分激发学生的学习热情，学生参与度高，课堂气氛活跃，效果良好"]
    let basicInfo = ["所在学院：","课程名称：","班  级：","授课教师：","授课教室：","授课时间："]
    let ketangInfo = ["应到人数：","实到人数：","迟到人数：","授课专题：","听课节次："]
    
    let basicInfos = UserDefaults.standard
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleView = UIView()
        let headerLabel = UILabel()
        
        titleView.frame = CGRect(x:0,y:60,width:100,height:40)
        titleView.backgroundColor = UIColor.gray
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.center = CGPoint(x: (self.view.frame.width - 80)/2, y: 0)
        
        switch section {
        case 0:
            headerLabel.text = headerStr[0]
        case 1:
            headerLabel.text = headerStr[1]
        case 2:
            headerLabel.text = headerStr[2]
        case 3:
            headerLabel.text = headerStr[3]
        default:
            break
        }
        headerLabel.sizeToFit()
        titleView.addSubview(headerLabel)
        
        return titleView
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return basicInfo.count
        }else if section == 1{
            return ketangInfo.count
        }else if section == 2{
            return str.count
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let contentWidth:CGFloat = tableView.frame.width * 0.6
        var strContent:NSString
        var buff = [String:Any]()
        let font = UIFont.systemFont(ofSize: 18)
        
        if indexPath.section == 2{
            
            strContent = str[indexPath.row] as NSString
            let size = strContent.boundingRect(with: CGSize(width: contentWidth, height: 100000), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:font], context: nil)
            return size.height + 20
            
            
        }else if indexPath.section == 3{
            return 200
        }
        
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "preview"
        let cellIds = "previews"
        let cellIdss = "previewss"
        //        let cellIds = "previews"
        //        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
        //        var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let basicInfos = UserDefaults.standard
        var buff = [String:Any]()
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
//        buff = basicInfos.value(forKey: "basicInfo") as! [String : Any]
//        print(buff)
        if indexPath.section == 0{

            let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)

            buff = basicInfos.value(forKey: "basicInfo") as! [String : Any]
            cell.textLabel?.text = basicInfo[indexPath.row]
            cell.detailTextLabel?.numberOfLines = 0
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            switch indexPath.row{
            case 0:

                cell.detailTextLabel?.text = buff["departText"] as? String
            case 1:

                cell.detailTextLabel?.text = buff["courseText"] as? String
            case 2:

                cell.detailTextLabel?.text = buff["classText"] as? String
            case 3:

                cell.detailTextLabel?.text = buff["teacherText"] as? String
            case 4:

                cell.detailTextLabel?.text = buff["classroomText"] as? String
            case 5:

                cell.detailTextLabel?.text = buff["dateText"] as? String
            default:
                break
            }
            //            UserDefaults.standard.removeObject(forKey: "basicInfo")
            return cell
        }
        else if indexPath.section == 1{
            let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
            cell.textLabel?.text = ketangInfo[indexPath.row]
            cell.detailTextLabel?.numberOfLines = 0
            cell.selectionStyle = UITableViewCellSelectionStyle.none

            buff = basicInfos.value(forKey: "ketangInfo") as! [String : Any]
            switch indexPath.row{
            case 0:
                cell.detailTextLabel?.text = "100"
            case 1:
                cell.detailTextLabel?.text = buff["shidao"] as! String
            case 2:
                cell.detailTextLabel?.text = buff["chidao"] as! String
            case 3:
                cell.detailTextLabel?.text = buff["shouke"] as! String
            case 4:
                cell.detailTextLabel?.text = buff["tingke"] as! String
            default:
                break
            }
            //            UserDefaults.standard.removeObject(forKey: "ketangInfo")
            return cell
        }
        else if indexPath.section == 2{

            //let cells = tableView.dequeueReusableCell(withIdentifier: cellIds, for: indexPath)
            let cells = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)

            var desLabel = UILabel()
            var pointLabel = UILabel()
            let buff = basicInfos.value(forKey: "pingfenInfo") as! [String:Any]

            desLabel.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.7, height: cells.frame.height)
            pointLabel.frame = CGRect(x:(self.view.frame.width * 0.8)  ,y:0,width:cells.frame.width * 0.3,height:cells.frame.height)

            //消除label中的文字重叠现象
            for view in cells.contentView.subviews{
                view.removeFromSuperview()
            }

            cells.contentView.addSubview(desLabel)
            cells.contentView.addSubview(pointLabel)

            desLabel.text = str[indexPath.row]
            desLabel.numberOfLines = 0

            cells.selectionStyle = UITableViewCellSelectionStyle.none

            switch indexPath.row {

            case 1:
                pointLabel.text = buff["point_1"] as? String
            //                cells.contentView.addSubview(pointLabel)
            case 3:
                pointLabel.text = buff["point_2"] as? String
            //                cells.contentView.addSubview(pointLabel)
            case 4:
                pointLabel.text = buff["point_3"] as? String
            //cells.contentView.addSubview(pointLabel)
            case 6:
                pointLabel.text = buff["point_4"] as? String
            // cells.contentView.addSubview(pointLabel)
            case 7:
                pointLabel.text = buff["point_5"] as? String
            //                cells.contentView.addSubview(pointLabel)
            case 9:
                pointLabel.text = buff["point_6"] as? String
            //                cells.contentView.addSubview(pointLabel)
            case 10:
                pointLabel.text = buff["point_7"] as? String
            //                cells.contentView.addSubview(pointLabel)
            case 12:
                pointLabel.text = buff["point_8"] as? String
            //                cells.contentView.addSubview(pointLabel)
            case 14:
                pointLabel.text = buff["point_9"] as? String
            //                cells.contentView.addSubview(pointLabel)
            default:
                break
            }



            return cells
        }
        else{
            //            let cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
            let buff = basicInfos.value(forKey: "pingyuInfo") as! [String:Any]
            //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdss, for: indexPath)
            let cells = UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
            cell.textLabel?.numberOfLines = 0

            cell.selectionStyle = UITableViewCellSelectionStyle.none //取消cellc的选中效果
            if indexPath.row == 0{
                //                cell.textLabel?.text = "1234dsadgadg特别说明：今年录入出错的情况可以直接修改。录入老师默认的用户名和密码都是工号，另学院教务科可在教务系统里师资管理下的教师密码项查询到已有教师的密码。进入工大教务处主页，下方的教务管理系统。以辅导员的工号登录网页，点击信息查询下的创新学分录入进入界面"
                cell.textLabel?.text = buff["pingyu"] as! String
            }else {
                //创建按钮
                let saveBtn = UIButton()
                let commitBtn = UIButton()

                saveBtn.frame = CGRect(x: 10, y: cell.frame.height * 0.3, width: (cell.frame.width * 0.7)/2, height: 30)
                commitBtn.frame = CGRect(x: ((cell.frame.width * 1.3)/2) - 10  , y: cell.frame.height * 0.3, width: (cell.frame.width * 0.7)/2, height: 30)

                saveBtn.setTitle("存到草稿箱", for:UIControlState.normal)
                commitBtn.setTitle("确认提交", for: UIControlState.normal)

                saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
                commitBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

                saveBtn.backgroundColor = UIColor.blue
                commitBtn.backgroundColor = UIColor.blue

                saveBtn.addTarget(self, action: #selector(saveDraft), for: .touchDown)
                commitBtn.addTarget(self, action: #selector(commitTable), for: .touchDown)

                cell.contentView.addSubview(saveBtn)
                cell.contentView.addSubview(commitBtn)

            }
            return cell
        }
        return cell
    }
    
    func initData () -> Parameters{
        var param:Parameters = [:] as [String:Any]
        var basicBuff = basicInfos.value(forKey: "basicInfo") as! [String:Any]
        var ketangBuff = basicInfos.value(forKey: "ketangInfo") as! [String:Any]
        var pingfenBuff = basicInfos.value(forKey: "pingfenInfo") as! [String:Any]

        param["courseid"] = basicBuff["courseId"]
        param["latenumber"] = ketangBuff["chidao"]
        param["presentnumber"] = ketangBuff["shidao"]
        param["topic"] = ketangBuff["shouke"]
        param["listentime"] = ketangBuff["tingke"]
        param["standardid"] = 100
        for i in 1...9{
            param["score\(i)"] = pingfenBuff["point_\(i)"]
        }
        param["comment"] = "1222"

        return param
    }
    
    @objc func saveDraft(){
        var param = initData()
        
        request("http://117.121.38.95:9817/mobile/form/buff/addjxzl.ht", method: .post, parameters: param).responseData{
            res in
            debugPrint(res)
        }
    }
    @objc func commitTable(){
        var param = initData()
        
        request("http://117.121.38.95:9817/mobile/form/jxzl/add.ht", method: .post, parameters: param).responseData{
            res in
            debugPrint(res)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewTable.delegate = self
        previewTable.dataSource = self
        
    }
}
