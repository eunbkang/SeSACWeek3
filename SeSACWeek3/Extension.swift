//
//  Extension.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/27.
//

import UIKit

extension UITableViewController {
    func showAlert() {
        let alert = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension UILabel {
    func configTitleText() {
        self.textColor = .red
        self.font = .preferredFont(forTextStyle: .headline)
        self.textAlignment = .center
    }
}
