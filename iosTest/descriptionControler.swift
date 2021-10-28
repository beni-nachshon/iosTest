//
//  descriptionControler.swift
//  iosTest
//
//  Created by beni nachshon on 27/10/2021.
//

import UIKit

class descriptionControler: UIViewController {

  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
     var Title: String = ""
     var imageName: UIImage = UIImage(named: "android")!
     var subTitel: String = ""
     var Description : String = ""
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = Title
        imageView.image =  imageName
        subTitleLabel.text = subTitel
        descriptionLabel.text = Description

       
    }
    

  
    }
