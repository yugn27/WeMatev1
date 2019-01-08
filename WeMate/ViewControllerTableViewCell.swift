//
//  ViewControllerTableViewCell.swift
//  FIRDBExample
//
//  Created by Belal Khan on 11/03/17.
//  Copyright © 2017 Belal Khan. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    //labels connected 
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
