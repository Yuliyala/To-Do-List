//
//  ToDoViewModel.swift
//  To-Do-List
//
//  Created by Yuliya Lapenak on 10/18/22.
//

import Foundation
import RealmSwift

class ToDoViewModel: NSObject {
    
    static var sharedInstance = ToDoViewModel()
    var task = [Task]()
    typealias completionHandler = () -> Void
    let realm = try! Realm()
    func addTask(task: Task, completion : completionHandler){
        self.realm.beginWrite()
        self.realm.add(task)
        try! self.realm.commitWrite()
        completion()
    }
    
    func editTask(task: Task, updatedTask: Task, completion : completionHandler){
        self.realm.beginWrite()
        //delete the old task
        self.realm.delete(task)
        // add the updated task
        self.realm.add(updatedTask)
        try! self.realm.commitWrite()
        completion()
    }
    
    func deleteTask(task: Task, indexTask: Int, completion : completionHandler) {
        self.realm.beginWrite()
        self.realm.delete(task)
        try! self.realm.commitWrite()
        self.task.remove(at: indexTask)
        completion()
    }
    
    func loadTask( completion : completionHandler) {
        self.realm.beginWrite()
        let savedTask = self.realm.objects(Task.self)
        self.task.removeAll()
        self.task.append(contentsOf: savedTask)
        try! self.realm.commitWrite()
        completion()
    }
}
