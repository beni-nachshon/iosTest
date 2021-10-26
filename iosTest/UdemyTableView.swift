//
//  UdemyTableView.swift
//  iosTest
//
//  Created by beni nachshon on 26/10/2021.
//

import UIKit
import QuartzCore

class UdemyTableView: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var images  = [ UIImage(named: "android"),
                    UIImage(named: "django"),
                    UIImage(named: "flutter"),
                    UIImage(named: "node"),
                    UIImage(named: "web")]
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "aaa"
        cell.imageView?.image = images[indexPath.row]
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.black.cgColor
       
        return cell    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
//     let path = Bundle.main.path(forResource: "Udemy courses", ofType: "json") {
//        do {
//              let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//              let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//              if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["courses"] as? [Any] {
//                        // do stuff
//              }
//          }
//    }
    
//     let path = Bundle.mainBundle().pathForResource("Udemy courses", ofType: "json")
//    {
//        if let jsonData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)
//        {
//            if let jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
//            {
//                if let persons : NSArray = jsonResult["courses"] as? NSArray
//                {
//                    // Do stuff
//                }
//            }
//         }
//    }
    @IBOutlet weak var userNameLabel: UILabel!
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
     
    }
    
  
    
    
    

}
