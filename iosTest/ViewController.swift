//
//  ViewController.swift
//  iosTest
//
//  Created by beni nachshon on 26/10/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
     userNameTextField.delegate = self
     passwordTextField.delegate = self
     loginButton.isEnabled = false
   
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let udemyTableView  : UdemyTableView = segue.destination as! UdemyTableView
        var userName = ""
        userName = userNameTextField.text ?? ""
        udemyTableView.userName = userName
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        if let text = textField.text, text.isEmpty {
           
            loginButton.isEnabled = false
       }
        else {
            loginButton.isEnabled = true
       }
        
    }

}
