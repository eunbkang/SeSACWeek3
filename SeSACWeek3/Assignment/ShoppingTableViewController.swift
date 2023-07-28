//
//  ShoppingTableViewController.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/27.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var headerBackgroundView: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = ShoppingData().list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    @IBAction func tappedAddButton(_ sender: UIButton) {
        guard let text = addTextField.text else {
            showAlert()
            return
        }
        let newItem = Shopping(item: text, isLiked: false, isDone: false)
        
        shoppingList.append(newItem)
        addTextField.text = ""
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as! ShoppingTableViewCell
        let row = shoppingList[indexPath.row]
        
        cell.shoppingList = shoppingList
        cell.configCell(row: row)
        cell.likeButton.tag = indexPath.row
        cell.selectionStyle = .none
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        
        shoppingList[indexPath.row].isDone.toggle()
        tableView.reloadData()
    }
    
    func configUI() {
        addButton.configCornerRadius()
        headerBackgroundView.configCornerRadius()
        
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        
        tableView.rowHeight = 60
    }
}
