//
//  MovieTableViewCell.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/28.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var runtimeLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    func configCell(row: Movie) {
        posterImageView.image = UIImage(named: row.title)
        movieTitleLabel.text = row.title
        releaseDateLabel.text = row.releaseDate
        runtimeLabel.text = "\(row.runtime)분"
        rateLabel.text = "\(row.rate)점"
        overviewLabel.text = row.overview
    }

}
