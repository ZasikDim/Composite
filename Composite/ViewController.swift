//
//  ViewController.swift
//  Composite
//
//  Created by Dmitry Zasenko on 20.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    private var currentTask: Task = MyTask(name: "Главные задачи")
    
    private var vc: ViewController {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        return vc!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addButton(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: "Введите новую задачу:", preferredStyle: .alert)
        let action = UIAlertAction(title: "Добавить", style: .default) { (action) in
            let text = alertController.textFields?.first?.text
            self.currentTask.addComponent(task: MyTask(name: text ?? "Без названия"))
            self.tableView.reloadData()
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTask.contentCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        guard let tasks = currentTask.showComponent() as? [Task] else {
            fatalError()
        }
        let task = tasks[indexPath.row]
        cell.nameLable.text = task.name
        cell.countLable.text = String(task.contentCount())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tasks = currentTask.showComponent() as? [Task] else {
            fatalError()
        }
        let task = tasks[indexPath.row]
        vc.currentTask = task
        showTask()
        
    }
    
    func showTask() {
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
