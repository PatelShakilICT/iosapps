//
//  CourseViewController.swift
//  PracticeApp
//
//  Created by MuhammadShakil Patel on 24/04/25.
//

import UIKit

class CourseViewController: UIViewController {

    
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnAdd(_ sender: Any) {
        
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let course = Course(context: moc)
        course.id = Int32(id.text!) ?? 0
        course.name = name.text!
        
        do{
            try moc.save()
            print("Course Inserted")
        }catch let er as NSError{
            print(er)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
