//
//  EditTaskViewController.swift
//  To-Do-List
//
//  Created by Yuliya Lapenak on 10/19/22.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var task : Task?
    var index: Int?
    
    let vm = ToDoViewModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task {
            name.text = myTask.name
            datePicker.date = myTask.time
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let newTask = Task(name: name.text ?? "", time: datePicker.date)
        vm.editTask(task: self.task!, updatedTask: newTask) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any){
        vm.deleteTask(task: self.task!, indexTask: self.index!) {
            navigationController?.popViewController(animated: true)
        }
    }
}
