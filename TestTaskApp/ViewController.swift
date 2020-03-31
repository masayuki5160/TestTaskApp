//
//  ViewController.swift
//  TestTaskApp
//
//  Created by TANAKA MASAYUKI on 2020/03/30.
//  Copyright © 2020 TANAKA MASAYUKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var taskList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableViewのデリゲートをViewControllerクラスで受け取る宣言
        tableView.delegate = self
        tableView.dataSource = self
        
        // TableViewで利用するオリジナルのTableViewCellを利用するための設定
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
    }
    
    // タスク追加ボタンをタップした時の処理
    @IBAction func addTaskButton(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "タスク追加", message: "追加するタスクを入力してください", preferredStyle: .alert)
        
        // アラートダイアログに追加するOKボタン
        let oKAlertAction = UIAlertAction(title: "OK", style: .default) {[weak self] (action) in
            // OKボタンをタップした時の処理
            if let inputText = alertController.textFields?.first?.text, inputText.count > 0 {
                self?.taskList.append(inputText)
                self?.tableView.reloadData()
            }
        }
        // アラートダイアログに追加するキャンセルボタン
        let cancelAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        // 各パーツをUIAlertControllerに追加
        alertController.addTextField { (textField) in
            textField.placeholder = "タスク詳細"
        }
        alertController.addAction(oKAlertAction)
        alertController.addAction(cancelAlertAction)
        
        // アラートダイアログを表示する
        present(alertController, animated: true, completion: nil)
    }
    
    
    // UITableViewDataSourceのdelegateメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TableViewに表示するセルの数
        return taskList.count
    }

    // UITableViewDataSourceのdelegateメソッド.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 作成したオリジナルのTableViewCellを利用
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.taskName.text = taskList[indexPath.row]

        return cell
    }
    
    // UITableViewDataSourceのdelegateメソッド. セルをタップした時の処理.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "タスク完了", message: "タスクを完了しますか？", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "完了", style: .default) { [weak self] (action) in
            self?.taskList.remove(at: indexPath.row)
            self?.tableView.reloadData()
        }
        let cancelAlertAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        // 各パーツをalertControllerに追加していく
        alertController.addAction(okAlertAction)
        alertController.addAction(cancelAlertAction)
        
        // タスク完了ダイアログの表示
        present(alertController, animated: true, completion: nil)
    }
}
