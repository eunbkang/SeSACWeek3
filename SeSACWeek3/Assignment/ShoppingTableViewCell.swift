//
//  ShoppingTableViewCell.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/28.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingTableViewCell"
    
    var shoppingList: [Shopping] = []
    
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var checkmarkImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var likeButton: UIButton!

    @IBAction func tappedLikeButton(_ sender: UIButton) {
        let index = sender.tag
        
        shoppingList[index].isLiked.toggle()
        configCell(row: shoppingList[index])
    }
    
    func configCell(row: Shopping) {
        cellBackgroundView.configCornerRadius()
        
        titleLabel.text = row.item
        titleLabel.font = .preferredFont(forTextStyle: .body)
        
        checkmarkImage.image = row.isDone ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        
        let starImage = row.isLiked ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        likeButton.setImage(starImage, for: .normal)
    }

}
