//
//  SearchViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/13.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,ExpressCompanyDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = APP_BGCOLOR
        createNavBarView()
        createView()
        
    }
    func createNavBarView(){
        let navBarView = UIView(frame: CGRectMake(0, 0, SCREEN_WIDTH, NAVBAR_HEIGHT))
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
        companyLab.tag = 100
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
        expressCompanyVC.delegate = self
        self.presentViewController(expressCompanyVC, animated: true, completion: nil)
        
    }
    
    func sendValue(value:String?){
        let companyLab = self.view.viewWithTag(100) as! UILabel
        companyLab.textColor = UIColor.blackColor()
        companyLab.text = value
    }

    func aboutApp(){
        
    }
    
    func reviewApp(){
        let str:String = "itms-apps://itunes.apple.com/cn/app/kuai-di-cha-xun-wang/id876836341"
        let url = NSURL(string: str)
        
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func queryExpress(){
        let com = "zto"
        
        let no = "404711955789"
        
        
        //创建NSURL对象
        let urlString:String = NSString(format:"http://v.juhe.cn/exp/index?key=\(APP_KEY)&com=\(com)&no=\(no)" ) as String
        let url:NSURL = NSURL(string: urlString)!
        //创建请求对象
        let request:NSURLRequest = NSURLRequest(URL: url)
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithRequest(request,completionHandler: {(data, response, error) -> Void in
        
            if error != nil{
                print(error?.code)
                print(error?.description)
            }else{
                let json : AnyObject! = try? NSJSONSerialization
                    .JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments)
                print("GET: -> \(json)")
                let queryDetailVC = QueryDetailViewController()
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(queryDetailVC, animated: true)
                self.hidesBottomBarWhenPushed = false;

            }
        })as NSURLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
        
        
        
        
        
    }
    
    func DetailExpress(json:AnyObject){
        let queryDetailVC = QueryDetailViewController()
      //  queryDetailVC.json = josn
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(queryDetailVC, animated: true)
        self.hidesBottomBarWhenPushed = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
