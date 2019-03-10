//
//  ConverterTableViewCell.swift
//  TemperatureConverter
//
//  Created by i1 23 on 2019-03-09.
//  Copyright © 2019 ICS224. All rights reserved.
//

import UIKit

class ConverterTableViewCell: UITableViewCell {

    @IBOutlet weak var converterLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
