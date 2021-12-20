//
//  Task.swift
//  Task
//
//  Created by Dmitry Zasenko on 20.12.21.
//

protocol Task {
    
    var name: String { get set }
    func showComponent() -> Any
    func addComponent(task: Task)
    func contentCount() -> Int
    
}

class MyTask: Task {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    private var tasks = [Task]()
    
    func showComponent() -> Any {
        return tasks
    }
    
    func addComponent(task: Task) {
        tasks.append(task)
    }
    
    func contentCount() -> Int {
        return tasks.count
    }
    
    
}
