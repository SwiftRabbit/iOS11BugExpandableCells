//
//  ExpandableCell.swift
//  iOS11BugExpandableCells
//
//  Created by Leopold Roitel on 17-09-14.
//  Copyright © 2017 Leopold Roitel. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell, NibReusable {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
