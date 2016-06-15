//
//  SearchViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/13.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = APP_BGCOLOR
        
        self.createView()
        
    }
    func createNavBarView(){
        let navBarView = navBar
        navBarView.backgroundColor = APP_RED
        self.view.addSubview(navBarView)
        let leftBtn = UIButton()
        leftBtn.frame = CGRectMake(0, 12, 50, IS_IOS7() ? 64:44)
        leftBtn.setTitle("关于", forState: .Normal)
        leftBtn.addTarget(self, action: Selector("aboutApp"), forControlEvents: .TouchUpInside)
        navBarView.addSubview(leftBtn)
        
        let titleLab = UILabel(frame:CGRectMake(80,IS_IOS7() ? 32:12,SCREEN_WIDTH-160,20))
        titleLab.text = "查询"
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
    
    func createView(){
        let trackingNoView = UIView(frame:CGRectMake(20,150,SCREEN_WIDTH-40,40))
        trackingNoView.layer.masksToBounds = true
        trackingNoView.layer.cornerRadius = 5
        trackingNoView.layer.borderColor = UIColor.lightGrayColor().CGColor
        trackingNoView.layer.borderWidth = 1
        self.view.addSubview(trackingNoView)
        
        let barCodeIMG = UIImageView(image: IMAGE("icon_query_numberlogo"))
        barCodeIMG.backgroundColor = COLOR(239, g: 239, b: 244)
        barCodeIMG.frame = CGRectMake(0, 0, 45, 40)
        trackingNoView.addSubview(barCodeIMG)
        
        let barCodeTextField = UITextField()
        barCodeTextField.frame = CGRectMake(45, 0, SCREEN_WIDTH-40-30-70, 40)
        barCodeTextField.placeholder = "请输入快递单号"
        barCodeTextField.clearButtonMode = UITextFieldViewMode.WhileEditing
        trackingNoView.addSubview(barCodeTextField)
        
        let cameraIMG = UIImageView(image: IMAGE ("icon_query_camera"))
        cameraIMG.frame = CGRectMake(SCREEN_WIDTH-40-50, 0, 45, 40)
        cameraIMG.userInteractionEnabled = true
        trackingNoView.addSubview(cameraIMG)
        
        let tapGesture = UITapGestureRecognizer(target: self,action: Selector("handleTapGesture"))
        tapGesture.numberOfTapsRequired = 1
        cameraIMG.addGestureRecognizer(tapGesture)
        
        let companyBtn = UIButton()
        companyBtn.frame = CGRectMake(20,210,SCREEN_WIDTH-40,40)
        companyBtn.layer.masksToBounds = true
        companyBtn.layer.cornerRadius = 5
        companyBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        companyBtn.layer.borderWidth = 1
        companyBtn.addTarget(self, action:Selector("chooseExpressCompany"), forControlEvents: .TouchUpInside)
        self.view.addSubview(companyBtn)
        
        
        let carIMG = UIImageView(image: IMAGE("icon_query_companylogo"))
        carIMG.backgroundColor = COLOR(239, g: 239, b: 244)
        carIMG.frame = CGRectMake(0, 0, 45, 40)
        companyBtn.addSubview(carIMG)
        
        let companyLab = UILabel()
        companyLab.frame = CGRectMake(45, 0, SCREEN_WIDTH-40-30-70, 40)
        companyLab.text = "请选择快递公司"
        companyLab.textColor = UIColor.lightGrayColor()
        companyBtn.addSubview(companyLab)
        
        let arrowIMG = UIImageView(image: IMAGE("search_arrow"))
        arrowIMG.frame = CGRectMake(SCREEN_WIDTH-40-30, 12, 10, 15)
        companyBtn.addSubview(arrowIMG)
        
        let queryBtn = UIButton()
        queryBtn.frame = CGRectMake(20,270,SCREEN_WIDTH-40,40)
        queryBtn.layer.masksToBounds = true
        queryBtn.layer.cornerRadius = 5
        queryBtn.backgroundColor = APP_RED
        queryBtn.setTitle("查询", forState: .Normal)
        queryBtn.addTarget(self, action: Selector("queryExpress"), forControlEvents: .TouchUpInside)
        self.view.addSubview(queryBtn)

    }
    
    func handleTapGesture(){
        let barCodeVC = BarCodeViewController()
        self.hidesBottomBarWhenPushed = true
         self.navigationController?.pushViewController(barCodeVC, animated: true)
        self.hidesBottomBarWhenPushed = false;
    }
    
    func chooseExpressCompany(){
        let expressCompanyVC = ExpressCompanyVC()
        self.presentViewController(expressCompanyVC, animated: true, completion: nil)
        
    }
    
    func queryExpress(){
    
        let queryDetailVC = QueryDetailViewController()
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(queryDetailVC, animated: true)
        self.hidesBottomBarWhenPushed = false;
    }

    func aboutApp(){
        
    }
    
    func reviewApp(){
        let str:String = "itms-apps://itunes.apple.com/cn/app/kuai-di-cha-xun-wang/id876836341"
        let url = NSURL(string: str)
        
        UIApplication.sharedApplication().openURL(url!)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
        self.createNavBarView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
