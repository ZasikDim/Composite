//
//  Task.swift
//  Task
//
//  Created by Dmitry Zasenko on 20.12.21.
//

protocol Task {
    var name: String { get set }
    var subtasks: [Task] { get set }
    func showComponent() -> Any
    func addComponent(task: Task)
    func contentCount() -> Int
    
}

class MyTask: Task {
    
    var name: String
    var subtasks = [Task]()
    var isRootTask = false
    
    init(name: String) {
        self.name = name
    }
    
    func showComponent() -> Any {
        return subtasks
    }
    
    func addComponent(task: Task) {
        subtasks.append(task)
    }
    
    func contentCount() -> Int {
        return subtasks.count
    }
    
}
