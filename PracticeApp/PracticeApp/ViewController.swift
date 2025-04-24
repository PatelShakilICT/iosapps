//
//  ViewController.swift
//  PracticeApp
//
//  Created by MuhammadShakil Patel on 24/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        if username.text == "admin" && password.text == "admin" {
            
            navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "home") as! TabViewController, animated: true)
            
        }
    }
    
}

