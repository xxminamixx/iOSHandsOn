//
//  ToDoCell.swift
//  iOSHandOn
//
//  Created by kyohei.minami on 2017/12/26.
//  Copyright © 2017年 handson. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var todo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

