//
//  HistoryViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/13.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = APP_BGCOLOR
        self.navigationController?.navigationBarHidden = true
        createNavBarView()
        
    }
    
    func createNavBarView(){
        let navBarView = UIView(frame: CGRectMake(0, 0,SCREEN_WIDTH, NAVBAR_HEIGHT))
        navBarView.backgroundColor = APP_RED
        self.view.addSubview(navBarView)
        
        let titleLab = UILabel(frame:CGRectMake(80,IS_IOS7() ? 32:12,SCREEN_WIDTH-160,20))
        titleLab.text = "查询历史"
        titleLab.font = FONT_SIZE(18)
        titleLab.textColor = UIColor.whiteColor()
        titleLab.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleLab)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
