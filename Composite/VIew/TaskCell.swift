//
//  TaskCell.swift
//  Composite
//
//  Created by Dmitry Zasenko on 22.12.21.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let identifier = "TaskCell"

    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var countLable: UILabel!
    
    func configuration (task: Task) {
        nameLable.text = "\(task.name)"
        countLable.text = "Количество подзадач: \(task.subtasks.count)"
    }
}
