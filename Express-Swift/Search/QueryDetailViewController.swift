//
//  QueryDetailViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/15.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class QueryDetailViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = APP_BGCOLOR
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
        leftBtn.addTarget(self, action: Selector("backSearchVC"), forControlEvents: .TouchUpInside)
        navBarView.addSubview(leftBtn)
        
        let titleLab = UILabel(frame:CGRectMake(80,IS_IOS7() ? 32:12,SCREEN_WIDTH-160,20))
        titleLab.text = "快递详情"
        titleLab.font = FONT_SIZE(18)
        titleLab.textColor = UIColor.whiteColor()
        titleLab.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLab)
        
    }

    func createTableView(){
        let queryTableView = UITableView(frame: CGRectMake(0, NAVBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-NAVBAR_HEIGHT),style:.Grouped)
        queryTableView.separatorInset = UIEdgeInsetsZero
        queryTableView.delegate = self
        queryTableView.dataSource = self
        self.view.addSubview(queryTableView)
    }
    
    func backSearchVC(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}

extension QueryDetailViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 76
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let bgView = UIView(frame:CGRectMake(0,0,SCREEN_WIDTH,120))
        bgView.backgroundColor = UIColor.brownColor()
        
        let noLab = UILabel(frame:CGRectMake(10,15,80,21))
        noLab.text = "订单编号:"
        bgView.addSubview(noLab)
        
        let noContentLab = UILabel(frame:CGRectMake(90,15,SCREEN_WIDTH-100,21))
        noContentLab.text = "404711955789"
        bgView.addSubview(noContentLab)
        
        let companyLabel = UILabel(frame:CGRectMake(10,40,80,21))
        companyLabel.text = "承运公司:"
        bgView.addSubview(companyLabel)
        
        let companyContentLab = UILabel(frame:CGRectMake(90,40,SCREEN_WIDTH-100,21))
        companyContentLab.text = "圆通速递"
        bgView.addSubview(companyContentLab)
        
        return bgView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var array = NSBundle.mainBundle().loadNibNamed("QueryDetailCell", owner: self, options: nil)
        let queryDetailCell = array[0] as! QueryDetailCell
        queryDetailCell.selectionStyle = UITableViewCellSelectionStyle.None
        return queryDetailCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}