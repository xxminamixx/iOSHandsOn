//
//  ViewController.swift
//  iOSHandOn
//
//  Created by kyohei.minami on 2017/12/26.
//  Copyright © 2017年 handson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        
        // TableViewにカスタムCellの登録
        todoTableView.register(UINib(nibName: "ToDoCell", bundle: nil), forCellReuseIdentifier: "ToDoCell")
        
        // NavigationBarの右側にプラスボタンを追加
        let rightNavigationItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(ViewController.addButtonTapped))
        navigationItem.setRightBarButton(rightNavigationItem, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        todoTableView.reloadData()
    }
    
    // プラスボタンタップ処理
    func addButtonTapped() {
        guard let addToDoViewController = storyboard?.instantiateViewController(withIdentifier: "AddToDoViewController") else {
            return
        }
        navigationController?.pushViewController(addToDoViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIViewControllerにUITableViewを設置しているのでオーバーライド
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        todoTableView.setEditing(editing, animated: animated)
    }

}

// MARK: テーブルビューの処理
extension ViewController: UITableViewDelegate {
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoListEntity.shared.todoCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 事前に登録しておいたセルの読み込み
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        cell.todo.text = ToDoListEntity.shared.todoPick(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ToDoListEntity.shared.deleteTodo(row: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
}

