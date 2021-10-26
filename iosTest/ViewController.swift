//
//  ViewController.swift
//  iosTest
//
//  Created by beni nachshon on 26/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let udemyTableView  : UdemyTableView = segue.destination as! UdemyTableView
        var userName = ""
        userName = userNameTextField.text ?? ""
        udemyTableView.userName = userName
    }
}

