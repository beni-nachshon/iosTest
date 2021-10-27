//
//  UdemyTableView.swift
//  iosTest
//
//  Created by beni nachshon on 26/10/2021.
//

import UIKit
import QuartzCore

class UdemyTableView: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
  weak   var DescriptionControler : descriptionControler?
    var  UdemyCoursesData : [course]  = []
    
    var cellIndexPath : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = userName
      
        self.UdemyCoursesData = loadJson("udemyCourses") ?? []
        print(self.UdemyCoursesData[0])
     
    }
    
    var images  = [ UIImage(named: "android"),
                    UIImage(named: "web"),
                    UIImage(named: "django"),
                    UIImage(named: "node"),
                    UIImage(named: "flutter")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UdemyCourseCell
        //cell.textLabel?.text = "aaa"
        cell.imageView?.image = images[indexPath.row]
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 3
        cell.titelLabel.text = self.UdemyCoursesData[indexPath.row].title
        cell.buttonCell.tag = indexPath.row
      
        
        
        
        return cell    }
    
  
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    

  
    @IBOutlet weak var userNameLabel: UILabel!
   
    var userName = ""
    
   
    
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
        DescriptionControler.imageName = images[button.tag] ?? UIImage(named: "android") as! UIImage
        DescriptionControler.subTitel = UdemyCoursesData[button.tag].Subtitle
        DescriptionControler.Description = UdemyCoursesData[button.tag].Description



    }
   
    
    
    

}
