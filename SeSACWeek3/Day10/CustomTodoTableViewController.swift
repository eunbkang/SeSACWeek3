//
//  CustomTodoTableViewController.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/28.
//

import UIKit

class CustomTodoTableViewController: UITableViewController {
    let todoList = TodoData().list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTodoTableViewCell.identifier) as! CustomTodoTableViewCell
        
        let row = todoList[indexPath.row]
        
        cell.configureCell(row: row)

        return cell
    }
    
    // 셀 선택
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}
