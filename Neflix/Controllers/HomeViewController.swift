//
//  HomeViewController.swift
//  Neflix
//
//  Created by 김하람 on 2023/08/01.
//

import UIKit

class HomeViewController: UIViewController {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
    // 클로저를 통해 homeFeedTable에 테이블 뷰를 생성
    private let homeFeedTable: UITableView = {
        // 이렇게 초기화 하면 상단에 헤더를 둘 수 있음.
        let table = UITableView(frame: .zero, style: .grouped)
        // 테이블 뷰를 생성하고, UITableViewCell 클래스를 등록(register)하며, 등록된 식별자(identifier)를 "cell"로 지정
        table.register(UITableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        // 현재 ViewController가 테이블 뷰의 델리게이트 역할을 수행한다는 것
        homeFeedTable.delegate = self
        
        homeFeedTable.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 테이블 뷰가 항상 뷰의 전체 영역을 차지하도록
        homeFeedTable.frame = view.bounds
    }
}

// HomeViewController 클래스를 확장하여 UITableViewDelegate와 UITableViewDataSource 프로토콜을 채택
// 이 프로토콜은 HomeViewController 클래스가 UITableView 객체의 동작을 제어할 수 있도록 허용한다.
// - UITableView 객체의 행 수, 행의 텍스트, 행의 높이 등을 제어
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    // 이렇게 하면 각 섹션 위에 구분선을 둘 수 있음
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    // UITableView 객체의 행 수를 반환
    // 이 메서드를 사용하여 UITableView 객체에 몇 개의 행이 표시되어야 하는지 지정할 수 있음
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // 이부분을 1로 바꿔주어야 구분선 둘 수 있음.
    }
    // UITableView 객체의 특정 행에 대한 UITableViewCell 객체를 반환
    // 이 메서드를 사용하여 UITableView 객체의 각 행에 어떤 텍스트가 표시되어야 하는지 지정할 수 있음
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "hello world"
//        cell.backgroundColor = .red
//        return cell
        // 위 코드는 tableview 사용을 알려주기 위한 코드
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    // 행의 높이를 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    // 섹션 헤더의 높이를 추정-섹션 헤더의 실제 높이를 계산하지 않고 대략적인 높이를 계산함
    // 섹션 헤더의 실제 높이는 섹션 헤더에 포함된 콘텐츠의 크기에 따라 달라지기 때문
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
}
