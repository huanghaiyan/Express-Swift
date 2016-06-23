//
//  QueryDetailCell.swift
//  Express-Swift
//
//  Created by 黄海燕 on 16/6/21.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

class QueryDetailCell: UITableViewCell {

    @IBOutlet weak var expressContentLab: UILabel!
    
    @IBOutlet weak var expressTimeLab: UILabel!
    
    @IBOutlet weak var expressStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
