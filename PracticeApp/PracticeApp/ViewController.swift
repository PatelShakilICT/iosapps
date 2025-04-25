//
//  ViewController.swift
//  PracticeApp
//
//  Created by MuhammadShakil Patel on 24/04/25.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            let req = Student.fetchRequest()
            req.predicate = NSPredicate(format: "name == %@ AND id", username.text!,password.text!)
            let res = try moc.fetch(req)
            if res.count > 0 {
                navigationController?.pushViewController(storyboard?.instantiateViewController(withIdentifier: "home") as! TabViewController, animated: true)
            }else{
                print("Invalid credentials")
            }
        }catch let er as NSError{
            print(er)
        }
        
    }
    
}

