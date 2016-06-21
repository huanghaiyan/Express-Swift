//
//  ExpressPhoneViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/13.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ExpressPhoneViewController: UIViewController {

    var mTableView = UITableView()
    var companyArray = NSArray()
    var dataArray = [CompanyModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = APP_BGCOLOR
        self.navigationController?.navigationBarHidden = true
        
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
        createTableView()

        createNavBarView()
    }

    func createNavBarView(){
        let navBarView = UIView(frame: CGRectMake(0, 0,SCREEN_WIDTH, NAVBAR_HEIGHT))
        navBarView.backgroundColor = APP_RED
        self.view.addSubview(navBarView)
        
        let titleLab = UILabel(frame:CGRectMake(80,IS_IOS7() ? 32:12,SCREEN_WIDTH-160,20))
        titleLab.text = "快递官方电话"
        titleLab.font = FONT_SIZE(18)
        titleLab.textColor = UIColor.whiteColor()
        titleLab.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLab)
        
    }
    
    func createTableView(){
        mTableView = UITableView(frame: CGRectMake(0, NAVBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVBAR_HEIGHT))
        mTableView.separatorInset = UIEdgeInsetsZero
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.registerClass(ExpressPhoneCell.self, forCellReuseIdentifier: "ExpressPhoneCell")
        //mTableView.sectionIndexColor = UIColor.blueColor()
        self.view.addSubview(mTableView)
    }

}

extension ExpressPhoneViewController:UITableViewDataSource, UITableViewDelegate{
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
        
        let expressPhoneCell = tableView.dequeueReusableCellWithIdentifier("ExpressPhoneCell", forIndexPath: indexPath) as! ExpressPhoneCell
        expressPhoneCell.selectionStyle = UITableViewCellSelectionStyle.None
        expressPhoneCell.companyModel1 = dataArray[indexPath.row]
        return expressPhoneCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let telPhone = dataArray[indexPath.row].companyTel
       
        let alertController = UIAlertController(title: telPhone, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "好的", style: .Default,handler: {action in
            let url1 = NSURL(string: "tel://"+telPhone)
            UIApplication.sharedApplication().openURL(url1!)
        })
        
        
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
        print(telPhone)
    }
    
    
}

