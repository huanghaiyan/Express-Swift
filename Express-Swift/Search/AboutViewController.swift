//
//  AboutViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/29.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = APP_BGCOLOR
        createNavBarView()
        
        let bgImageView = UIImageView(image: IMAGE("panda.png"))
        bgImageView.frame = CGRectMake(0, 100, 250, 300)
        bgImageView.center.x = self.view.center.x
        self.view.addSubview(bgImageView)
        
        let contentStr:String = "欢迎使用我的快递查询软件，本软件免费为大家提供，希望各位生活愉快，工作顺利！"
        let contentLab = UILabel()
        contentLab.text = contentStr
        contentLab.numberOfLines = 0
        let options : NSStringDrawingOptions = .UsesLineFragmentOrigin
        let boundingRect = contentStr.boundingRectWithSize(CGSizeMake(SCREEN_WIDTH - 40, 0), options: options, attributes: [NSFontAttributeName:FONT_SIZE(18)], context: nil)
        contentLab.frame = CGRectMake(20, 420, SCREEN_WIDTH-40, boundingRect.size.height + 1)
        self.view.addSubview(contentLab)
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
        titleLab.text = "关于"
        titleLab.font = FONT_SIZE(18)
        titleLab.textColor = UIColor.whiteColor()
        titleLab.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLab)
        
    }
    
    func backSearchVC(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
