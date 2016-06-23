//
//  ExpressCompanyVC.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/15.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

//代理传值
protocol ExpressCompanyDelegate {
    func sendValue(value:String?)
}

class ExpressCompanyVC: UIViewController {

    var mTableView = UITableView()
    var companyArray = NSArray()
    var dataArray = [CompanyModel]()
    var delegate:ExpressCompanyDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = APP_BGCOLOR
        
        
        let path = NSBundle.mainBundle().pathForResource("company", ofType: "plist")
        companyArray = NSArray(contentsOfFile:path!)!
        
        print(companyArray)
        for (i,dict) in companyArray.enumerate() {
            let companyName = dict["name"] as! String
            let companyCode = dict["code"] as! String
            let companyIndex = dict["index"] as! String
            let companyTel = dict["tel"] as! String
            let model = CompanyModel(companyCode:companyCode,companyIndex:companyIndex,companyName:companyName,companyTel:companyTel)
            print(model.companyCode)
            dataArray.append(model)
        }
        print(dataArray)
        createNavBarView()
        createTableView()
        
    }
    
    func createNavBarView(){
        let navBarView = UIView(frame: CGRectMake(0, 0,SCREEN_WIDTH, NAVBAR_HEIGHT))
        navBarView.backgroundColor = APP_RED
        self.view.addSubview(navBarView)
        
        let leftBtn = UIButton()
        leftBtn.frame = CGRectMake(0, 12, 50, IS_IOS7() ? 64:44)
        leftBtn.setTitle("返回", forState: .Normal)
        leftBtn.addTarget(self, action: Selector("back"), forControlEvents: .TouchUpInside)
        navBarView.addSubview(leftBtn)
        
        let titleLab = UILabel(frame:CGRectMake(80,IS_IOS7() ? 32:12,SCREEN_WIDTH-160,20))
        titleLab.text = "选择快递公司"
        titleLab.font = FONT_SIZE(18)
        titleLab.textColor = UIColor.whiteColor()
        titleLab.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLab)
        
        let rightBtn = UIButton()
        rightBtn.frame = CGRectMake(SCREEN_WIDTH-50, 12, 50, IS_IOS7() ? 64:44)
        rightBtn.setTitle("点评", forState: .Normal)
        rightBtn.addTarget(self, action: Selector("reviewApp"), forControlEvents: .TouchUpInside)
        navBarView.addSubview(rightBtn)

    }
    
    func createTableView(){
        mTableView = UITableView(frame: CGRectMake(0, NAVBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVBAR_HEIGHT))
        mTableView.separatorInset = UIEdgeInsetsZero
        mTableView.delegate = self
        mTableView.dataSource = self
//        mTableView.sectionIndexColor = UIColor.blueColor()
        self.view.addSubview(mTableView)
    }

    func back(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func reviewApp(){
        let str:String = "itms-apps://itunes.apple.com/cn/app/kuai-di-cha-xun-wang/id876836341"
        let url = NSURL(string: str)
        
        UIApplication.sharedApplication().openURL(url!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ExpressCompanyVC:UITableViewDataSource, UITableViewDelegate{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //每一块有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        var array = NSBundle.mainBundle().loadNibNamed("ExpressCompanyCell", owner: self, options: nil)
        let expressCompanyCell = array[0] as! ExpressCompanyCell
        expressCompanyCell.selectionStyle = UITableViewCellSelectionStyle.None
        expressCompanyCell.companyModel = dataArray[indexPath.row]
        return expressCompanyCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (delegate != nil) {
            delegate?.sendValue(dataArray[indexPath.row].companyName)
        }

        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
