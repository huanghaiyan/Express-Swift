//
//  ExpressCompanyVC.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/15.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ExpressCompanyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = APP_BGCOLOR
        //self.createNavBarView()
        
        
        

    }
    
    func createNavBarView(){
        let navBarView = navBar
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
    
    func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    func reviewApp(){
        let str:String = "itms-apps://itunes.apple.com/cn/app/kuai-di-cha-xun-wang/id876836341"
        let url = NSURL(string: str)
        
        UIApplication.sharedApplication().openURL(url!)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.createNavBarView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
