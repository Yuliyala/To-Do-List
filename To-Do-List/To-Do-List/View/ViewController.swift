//
//  ViewController.swift
//  To-Do-List
//
//  Created by Yuliya Lapenak on 10/18/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var data : [Task] = [Task(name: "Task1", time: Date()), Task(name: "Task2", time: Date())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    func setupTable(){
        tableView.layer.cornerRadius = 20
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addButton(_ sender: Any) {
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let  dateString = dateFormatter.string(from: data[indexPath.row].time)
        cell.detailTextLabel?.text = dateString
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
}

extension ViewController: UITableViewDelegate {
    
}
