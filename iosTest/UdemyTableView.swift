//
//  UdemyTableView.swift
//  iosTest
//
//  Created by beni nachshon on 26/10/2021.
//

import UIKit
import QuartzCore

class UdemyTableView: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    var userName = ""
    var  UdemyCoursesData : [course]  = []
    var images  = [ UIImage(named: "android"),
                    UIImage(named: "web"),
                    UIImage(named: "django"),
                    UIImage(named: "node"),
                    UIImage(named: "flutter")]
    
    @IBOutlet weak var userNameLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
      
        self.UdemyCoursesData = loadJson("udemyCourses") ?? []
            
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UdemyCourseCell
        
        cell.imageView?.image = images[indexPath.row]
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 3
        cell.titelLabel.text = self.UdemyCoursesData[indexPath.row].title
        cell.buttonCell.tag = indexPath.row
        
        switch (UdemyCoursesData[indexPath.row].stars){
        case 3:
            cell.stars[4].image = UIImage(named: "blackstar3")
            cell.stars[3].image = UIImage(named: "blackstar3")
            break
        case 4:
            cell.stars[4].image = UIImage(named: "blackstar3")
            break
            
        default: break
            
        }
        return cell
        
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    struct ResponseData: Decodable {
        var courses : [course]
    }
   
    struct course : Decodable {
        var courseName: String
        var title: String
        var Subtitle: String
        var Description: String
        var stars: Int
        
    }
  
    func loadJson(_ fileName: String) -> [course]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
             
               
               
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.courses
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let  button = sender as? UIButton else {return}
        
        let DescriptionControler  : descriptionControler = segue.destination as! descriptionControler

        DescriptionControler.Title = UdemyCoursesData[button.tag].title
        DescriptionControler.imageName = images[button.tag] ?? UIImage(named: "android")!
        DescriptionControler.subTitel = UdemyCoursesData[button.tag].Subtitle
        DescriptionControler.Description = UdemyCoursesData[button.tag].Description

    }
   
}
