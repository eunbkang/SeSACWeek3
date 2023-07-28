//
//  MovieTableViewController.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/28.
//

import UIKit

class MovieTableViewController: UITableViewController {

    var movieList = MovieInfo().movie
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 140
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as! MovieTableViewCell
        let row = movieList[indexPath.row]
        
        cell.configCell(row: row)
        
        return cell
    }
}
