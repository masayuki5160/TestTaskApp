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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableViewのデリゲートをViewControllerクラスで受け取る宣言
        tableView.delegate = self
        tableView.dataSource = self
        
        // TableViewで利用するオリジナルのTableViewCellを利用するための設定
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TaskTableViewCell")
    }
    
    // UITableViewDataSourceのdelegateメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 仮実装としてTableViewに表示するセルの数を5としています (セクションの数はデフォルト1となっています)
        return 5
    }

    // UITableViewDataSourceのdelegateメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 作成したオリジナルのTableViewCellを利用
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        return cell
    }
}
