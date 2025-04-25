//
//  ShowViewController.swift
//  PracticeApp
//
//  Created by MuhammadShakil Patel on 24/04/25.
//

import UIKit

class ShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var students : [Student] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let std = students[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = "ID : \(std.id)\nName : \(std.name!)\nDate : \(std.date?.description ?? "")\nCourse : \(std.course?.name ?? "")"
        
        
        return cell!
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            students = try moc.fetch(Student.fetchRequest())
            print(students)
        }catch let er as NSError{
            print(er)
        }
    }			
    	
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        tableView.reloadData()
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
