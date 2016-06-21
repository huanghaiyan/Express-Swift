//
//  GlobalConst.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/14.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import Foundation
import UIKit


let APP_KEY = "cd77edb3f9bbbac2ebe55e311f9e1714"

//屏幕的宽度，高度
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width

let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
//导航栏的高度
let NAVBAR_HEIGHT = IS_IOS7() ? 64:44 as CGFloat

//本地图标赋值简写
func IMAGE(name:String)->UIImage{
    return UIImage(named: name)!
}

//设置字体的简写
func FONT_SIZE(size:CGFloat)->UIFont{
    return UIFont.systemFontOfSize(size)
}
//APP色调
let APP_RED = UIColor(colorLiteralRed:235/255,green:114/255,blue:118/255,alpha:1)
let APP_BGCOLOR = UIColor(colorLiteralRed:245/255,green:247/255,blue:247/255,alpha:1)

//色值简写
func COLOR(r:CGFloat,g:CGFloat,b:CGFloat)->UIColor{
    
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    
}

func COLORA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0,green:g/255.0,blue:b/255.0,alpha:a)
}

func UIColorFromRGB(rgbValue:Int)-> UIColor {
    return UIColor(red:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue:((CGFloat)(rgbValue & 0xFF))/255.0, alpha:1.0)
}

//系统版本
//let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
//let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0

let systemVersion = (UIDevice .currentDevice().systemVersion as String)

func IS_IOS7() ->Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0 }
func IS_IOS8() -> Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0 }





