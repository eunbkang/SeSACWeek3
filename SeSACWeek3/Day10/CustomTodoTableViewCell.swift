//
//  CustomTodoTableViewCell.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/28.
//

import UIKit

class CustomTodoTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTodoTableViewCell"

    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var checkmarkView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    
    func configureCell(row: Todo) {
        titleLabel.text = row.title
        subtitleLabel.text = row.subtitle
        
        checkmarkView.image = row.isLiked ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "checkmark.square.fill")
        
        let starImage = row.isDone ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
        favoriteButton.setImage(starImage, for: .normal)
    }
}
