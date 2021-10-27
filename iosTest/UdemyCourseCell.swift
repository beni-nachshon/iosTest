//
//  UdemyCourseCell.swift
//  iosTest
//
//  Created by beni nachshon on 27/10/2021.
//

import UIKit

class UdemyCourseCell: UITableViewCell {
    
    var indexOfRow : Int = 0
    
    @IBOutlet weak var buttonCell: UIButton!
    
    
    
    @IBOutlet weak var titelLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
