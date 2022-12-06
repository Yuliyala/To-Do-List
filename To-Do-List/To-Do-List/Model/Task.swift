//
//  Task.swift
//  To-Do-List
//
//  Created by Yuliya Lapenak on 10/18/22.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var time: Date = Date()

    override init() {
        super.init()
    }
    
    init(name: String, time: Date){
        self.name = name
        self.time = time
    }
}
