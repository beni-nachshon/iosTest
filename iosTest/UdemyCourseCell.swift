//
//  UdemyCourseCell.swift
//  iosTest
//
//  Created by beni nachshon on 27/10/2021.
//

import UIKit

class UdemyCourseCell: UITableViewCell {
    
        
    @IBOutlet weak var buttonCell: UIButton!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet var stars: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
