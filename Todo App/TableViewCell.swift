//
//  TableViewCell.swift
//  Todo App
//
//  Created by Jacob Pashman on 7/6/18.
//  Copyright © 2018 jacobpashman. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var checkBoxView: Checkbox!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
