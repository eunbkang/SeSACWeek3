//
//  StudyTableViewController.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/27.
//

import UIKit

class StudyTableViewController: UITableViewController {

    let studyList = ["변수", "상수", "열거형", "구조체", "클래스", "옵셔널", "프로퍼티", "메서드", "테이블뷰"]
    let deviceList = ["아이폰", "애플워치", "아이패드", "맥북", "아이맥", "에어팟"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 모든 셀이 같은 높이라면 heightForRowAt 메소드 대신 이렇게
        tableView.rowHeight = 60
        
    }
    
    // 섹션 갯수 (기본값은 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션 내 헤더 타이틀 (String? 이므로 없으면 nil)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "공부 목록" : "기기 목록"
    }
    
    //1. (필수) 셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section == 0 ? studyList.count : deviceList.count
    }
    
    //2. (필수) 셀 데이터 및 디자인 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // identifier에 맞는 셀이 없을 가능성 존재하므로 옵셔널로 반환 > 해제 필요
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")!
        
        if indexPath.section == 0 {
            // textLabel, detailTextLabel 등 - 호출 가능하긴 하지만 사용자가 설정한 cell style 등에 따라 없을 수도 있으므로 옵셔널
            cell.textLabel?.text = studyList[indexPath.row]
            cell.detailTextLabel?.text = ""
        } else {
            cell.textLabel?.text = deviceList[indexPath.row]
        }
        cell.textLabel?.font = .preferredFont(forTextStyle: .body)
        
        return cell
    }

    //3. 셀 높이 (없으면 기본값 44)
    // 서비스 구현에 따라 필요한 경우가 많지만, 항상 같은 높이를 셀에 적용한다면 비효율적일 수 있음 - print(#function) 시 많이 호출되는 것 보임
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    }
}
