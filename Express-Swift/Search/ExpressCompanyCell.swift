//
//  ExpressCompanyCell.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/16.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ExpressCompanyCell: UITableViewCell {
    @IBOutlet weak var companyNameLab: UILabel!

    @IBOutlet weak var companyIcon: UIImageView!
    
    var companyModel:CompanyModel?{
        didSet {
            self.layoutSubviews()
            companyNameLab?.text = companyModel!.companyName
            companyIcon?.image = UIImage(named:companyModel!.companyCode)
            companyIcon.layer.masksToBounds = true
            companyIcon.layer.cornerRadius = companyIcon.frame.size.width/2
        }
    }
   
    
}
