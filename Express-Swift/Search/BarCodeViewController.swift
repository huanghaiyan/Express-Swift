//
//  BarCodeViewController.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/15.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit
import AVFoundation

class BarCodeViewController: UIViewController{
    var animationImgView:UIImageView = UIImageView()
    var session = AVCaptureSession()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = COLORA(255, g: 255, b: 255, a: 0.3)
        createNavBarView()
        let boundImageView = UIImageView(frame:CGRectMake((SCREEN_WIDTH - 240)/2, 200, 240, 240))
        var image = IMAGE("qrcode_border")
        //拉伸图片
        image = image.resizableImageWithCapInsets(UIEdgeInsetsMake(25, 25, 25, 25))
        boundImageView.image = image
        self.view.addSubview(boundImageView)
        //减掉超出边界的内容
        boundImageView.clipsToBounds = true
        
        self.animationImgView.frame = CGRectMake(0, 20, 240, 20)
        //来回扫描的图片
        self.animationImgView.image = IMAGE("barscan_cursor")
        boundImageView.addSubview(self.animationImgView)
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("changeImageFrame:"), userInfo: nil, repeats: true) //NSTimer(timeInterval: 0.03, target: self, selector: Selector("changeImageFrame:"), userInfo: nil, repeats: true)
        timer.fire()
        
        self.initCapture()
        
        let flashBtn = UIButton(frame:CGRectMake((SCREEN_WIDTH - 240)/2, 480, 240, 44))
        flashBtn.backgroundColor = UIColorFromRGB(0xFFA43E)
        flashBtn.setTitle("闪光灯", forState: .Normal)
        flashBtn.addTarget(self, action: Selector("openFlash"), forControlEvents: .TouchUpInside)
        self.view.addSubview(flashBtn)
        
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
        titleLab.text = "扫描快递单号"
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
    
    func changeImageFrame(timer:NSTimer){
        self.animationImgView.frame = CGRectOffset(self.animationImgView.frame, 0, 5)
        let x:CGFloat = self.animationImgView.frame.size.height
        let w:CGFloat = self.animationImgView.frame.size.width
        if self.animationImgView.frame.origin.y >= x+220 {
            self.animationImgView.frame = CGRectMake(0, -x , w, x);
        }
    }
    
    private func initCapture(){
        //获取摄像设备
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        let error:NSError?
        //创建输入流
        var input : AVCaptureDeviceInput = AVCaptureDeviceInput()
        do {
            input = try AVCaptureDeviceInput(device: device)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        //创建输出流
        let output = AVCaptureMetadataOutput.init()
        //设置代理 在主线程刷新
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        //初始化链接对象
        self.session = AVCaptureSession.init()
        //高质量采集率
        self.session.canSetSessionPreset(AVCaptureSessionPresetHigh)
        self.session.addInput(input)
        self.session.addOutput(output)
        
        //设置扫码支持的编码格式(设置条形码和二维码兼容)
        
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeCode128Code]
        
        let layer = AVCaptureVideoPreviewLayer.init(session: self.session)
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        //扫描框的位置和大小
        layer.frame = CGRectMake((SCREEN_WIDTH - 240)/2, 200, 240, 240)
        self.view.layer.insertSublayer(layer, atIndex: 0)
        //开始捕获
        self.session.startRunning()

    }
    
    func openFlash(){
        
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        if !captureDevice.hasTorch {
            UIAlertView(title: "提示", message:"闪光灯故障", delegate:nil, cancelButtonTitle: "确定").show()
        }else{
            if  captureDevice.torchMode != AVCaptureTorchMode.On || captureDevice.flashMode != AVCaptureFlashMode.On {
                //打开闪光灯
                do{
                    try captureDevice.lockForConfiguration()
                    captureDevice.torchMode = AVCaptureTorchMode.On
                    captureDevice.flashMode = AVCaptureFlashMode.On
                    captureDevice.unlockForConfiguration()
                    
                }catch
                {
                    print(error)
                    
                }
            }else{
                //关闭闪光灯
                do{
                    try captureDevice.lockForConfiguration()
                    captureDevice.torchMode = AVCaptureTorchMode.Off
                    captureDevice.flashMode = AVCaptureFlashMode.Off
                    captureDevice.unlockForConfiguration()
                    
                }catch
                {
                    print(error)
                    
                }
            }
            
        }
    }

    func backSearchVC(){
        self.navigationController?.popViewControllerAnimated(true)
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

extension BarCodeViewController:AVCaptureMetadataOutputObjectsDelegate{
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        var stringValue:String?
        if metadataObjects.count>0 {
            
            var metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            stringValue = metadataObject.stringValue
            print(stringValue)
            if stringValue != nil {
                self.session.stopRunning()
            }
            
        }
        self.session.stopRunning()
    }
    
}
