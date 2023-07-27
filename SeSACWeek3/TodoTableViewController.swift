//
//  TodoTableViewController.swift
//  SeSACWeek3
//
//  Created by Eunbee Kang on 2023/07/27.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var list = ["장보기", "영화보기", "책읽기", "코딩공부", "물마시기", "운동하기", "고양이만지기", "일찍자기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func tappedPlusButton(_ sender: UIBarButtonItem) {
        
        showAlert()
        
        // 1. list에 요소 추가
        list.append("일찍일어나기")
        print(list)
        
        // 2. 테이블뷰 갱신 (테이블뷰 함수를 다시한번 실행해주는 효과)
        tableView.reloadData()
    }
    
    //1. 섹션 내 셀의 갯수 : 카톡 친구 수만큼 셀 갯수가 필요하다고 iOS에게 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    //2. 셀 디자인 및 데이터 처리 : 카톡 프로필 모서리 둥글게, 프로필 이미지, 상태 메시지 반영 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#function, indexPath)
        
        // identifier는 인터페이스 빌더에서 설정
        // 재사용 매커니즘 dequeueReusableCell
        // identifier에 해당하는 셀 없을 수도 있음. cell은 옵셔널
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell")!
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .systemGray6
        
        cell.textLabel?.text = list[indexPath.row]
        
        cell.textLabel?.configTitleText()
        
        cell.detailTextLabel?.text = "디테일 텍스트"
        cell.detailTextLabel?.textColor = .blue
        cell.detailTextLabel?.font = .preferredFont(forTextStyle: .subheadline)
        
        cell.imageView?.image = UIImage(systemName: "star.fill")
        
        return cell
    }
    
    //3. 셀의 높이. default는 44
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 72
    }
    
}
