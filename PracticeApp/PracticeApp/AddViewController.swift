//
//  AddViewController.swift
//  PracticeApp
//
//  Created by MuhammadShakil Patel on 24/04/25.
//

import UIKit

class AddViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var courses : [Course] = []
    var course : Course? = nil
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return courses.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return courses[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        course = courses[row]
    }
    

    @IBOutlet weak var pc: UIPickerView!
    @IBOutlet weak var dp: UIDatePicker!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCourses()

        // Do any additional setup after loading the view.
    }
    
    func loadCourses(){
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            courses = try moc.fetch(Course.fetchRequest())
        }catch let er as NSError{
            print(er)
        }
        dp.reloadInputViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCourses()
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let std = Student(context: moc)
        std.id = Int32(id.text!) ?? 0
        std.name = name.text!
        std.course = course
        std.date = dp.date
        do{
            try moc.save()
            id.text = nil
            name.text = nil
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
