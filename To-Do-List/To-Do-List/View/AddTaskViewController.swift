//
//  AddTaskViewController.swift
//  To-Do-List
//
//  Created by Yuliya Lapenak on 10/18/22.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        print("Saving task...")
        let task = Task(name: taskName.text ?? "", time: datePicker.date)
        let vm = ToDoViewModel.sharedInstance
        vm.addTask(task: task) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
