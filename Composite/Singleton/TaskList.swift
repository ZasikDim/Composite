//
//  TaskList.swift
//  Composite
//
//  Created by Dmitry Zasenko on 21.12.21.
//

import Foundation

class TaskList {
    
    private init() {}
    
    static let shared = TaskList()
    var taskList: [Task] = []
    
}
