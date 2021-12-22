//
//  ViewController.swift
//  Composite
//
//  Created by Dmitry Zasenko on 20.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    var currentTask: Task?
    var lastTasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nibell = UINib(nibName: TaskCell.identifier, bundle: nil)
        tableView.register(nibell, forCellReuseIdentifier: TaskCell.identifier)
        
        let task = MyTask(name: "main")
        task.subtasks = TaskList.shared.taskList
        currentTask = task
    }
    
    @IBAction func backTapped(_ sender: UIBarButtonItem) {
        if lastTasks.isEmpty {
            debugPrint("lastTasks is empti")
        } else {
            currentTask = lastTasks.removeLast()
            tableView.reloadData()
        }
    }

    @IBAction func addButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Введите новую задачу:", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter task name"
        }
        let addAction = UIAlertAction(title: "Добавить", style: .default, handler: { alert -> Void in
            let text = alertController.textFields?.first?.text ?? "Без названия"
            let newTask = MyTask(name: text)
            self.currentTask!.subtasks.append(newTask)
            self.tableView.reloadData()
        })
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: {
            (action : UIAlertAction) -> Void in })
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTask?.subtasks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier) as! TaskCell
        guard let currentTask = self.currentTask else { return cell }
        cell.configuration(task: currentTask.subtasks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentTask = self.currentTask else { return }
        let selectTask = currentTask.subtasks[indexPath.row]
        lastTasks.append(currentTask)
        self.currentTask = selectTask
        self.tableView.reloadData()
    }
}
