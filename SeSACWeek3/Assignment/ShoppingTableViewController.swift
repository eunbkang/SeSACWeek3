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
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }

    @IBAction func tappedAddButton(_ sender: UIButton) {
        guard let text = addTextField.text else {
            showAlert()
            return
        }
        
        shoppingList.append(text)
        addTextField.text = ""
        tableView.reloadData()
    }
    
    func configUI() {
        configCornerRadiusToView(addButton)
        configCornerRadiusToView(headerBackgroundView)
        
        addTextField.placeholder = "무엇을 구매하실 건가요?"
    }
    
    func configCornerRadiusToView(_ view: UIView, amount: CGFloat = 10) {
        view.layer.cornerRadius = amount
        view.clipsToBounds = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell")!
        let star = UIImageView(image: UIImage(systemName: "star"))
        let checkMark = UIImageView(image: UIImage(systemName: "checkmark.square"))
        
        cell.textLabel?.text = shoppingList[indexPath.row]
        cell.textLabel?.font = .preferredFont(forTextStyle: .body)
        
        cell.selectionStyle = .none
        
        star.tintColor = .systemYellow
        cell.accessoryView = star
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        let cell = tableView.cellForRow(at: indexPath)!
        
        let currentImage = cell.imageView?.image
        let image1 = UIImage(systemName: "checkmark.square")
        let image2 = UIImage(systemName: "checkmark.square.fill")
        
        cell.imageView?.image = self.toggleImage(currentImage: currentImage, image1: image1, image2: image2)
    }
    
    func toggleImage(currentImage: UIImage?, image1: UIImage?, image2: UIImage?) -> UIImage? {
        let returnImage = currentImage == image1 ? image2 : image1
        
        return returnImage
    }
}
