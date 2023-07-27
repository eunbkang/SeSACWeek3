//
//  SettingTableViewController.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/27.
//

import UIKit

class SettingTableViewController: UITableViewController {
    enum Section: String, CaseIterable {
        case general = "전체 설정"
        case personal = "개인 설정"
        case etc = "기타"
        
        var list: [String] {
            switch self {
            case .general: return ["공지사항", "실험실", "버전 정보"]
            case .personal: return ["개인/보안", "알림", "채팅", "멀티프로필"]
            case .etc: return ["고객센터/도움말"]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionList = Section.allCases
        let type = Section(rawValue: sectionList[section].rawValue)!
        
        return type.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        let sectionList = Section.allCases
        let thisSection = sectionList[indexPath.section].rawValue
        let type = Section(rawValue: thisSection)!
        
        cell.textLabel?.text = type.list[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionList = Section.allCases
        let header = sectionList[section].rawValue
        
        return header
    }
}
