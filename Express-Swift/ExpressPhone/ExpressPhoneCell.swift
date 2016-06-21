//
//  ExpressPhoneCell.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/20.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class ExpressPhoneCell: UITableViewCell {
    var iconImageView = UIImageView()
    var expressNameLab = UILabel()
    var expressTelLab = UILabel()
    
    var companyModel1:CompanyModel?{
        didSet {
            
            expressNameLab.text = companyModel1!.companyName
            iconImageView.image = UIImage(named:companyModel1!.companyCode)
            expressTelLab.text = companyModel1?.companyTel
            
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = CGRectMake(10, 10, 50, 50)
        self.addSubview(iconImageView)
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width/2
        
        expressNameLab.frame = CGRectMake(70, 10, 200, 21)
        self.addSubview(expressNameLab)
        
        expressTelLab.frame = CGRectMake(70, 35, 200, 21)
        self.addSubview(expressTelLab)
    }
 
}
