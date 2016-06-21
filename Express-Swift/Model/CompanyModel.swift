//
//  CompanyModel.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/15.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

struct CompanyModel{
    var companyCode:String
    var companyIndex:String
    var companyName:String
    var companyTel:String
    
    init(companyCode:String,companyIndex:String,companyName:String,companyTel:String){
        self.companyCode = companyCode
        self.companyIndex = companyIndex
        self.companyName = companyName
        self.companyTel = companyTel
    }
}
