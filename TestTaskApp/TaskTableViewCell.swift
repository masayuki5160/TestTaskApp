//
//  TaskTableViewCell.swift
//  TestTaskApp
//
//  Created by TANAKA MASAYUKI on 2020/03/30.
//  Copyright © 2020 TANAKA MASAYUKI. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
