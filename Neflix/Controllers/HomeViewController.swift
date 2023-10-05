//
//  HomeViewController.swift
//  Neflix
//
//  Created by 김하람 on 2023/08/01.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending TV", "Upcoming Movies", "Top rated"]
    
    // 클로저를 통해 homeFeedTable에 테이블 뷰를 생성
    private let homeFeedTable: UITableView = {
        // 이렇게 초기화 하면 상단에 헤더를 둘 수 있음.
        let table = UITableView(frame: .zero, style: .grouped)
        // 테이블 뷰를 생성하고, UITableViewCell 클래스를 등록(register)하며, 등록된 식별자(identifier)를 "cell"로 지정
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    private func configureNavbar() {
        
        var image = UIImage(named: "netflix")
        // image를 원본으로 사용하겠다는 것. 이걸 안쓰면 넷플로고가 파란색임
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        // 현재 ViewController가 테이블 뷰의 델리게이트 역할을 수행한다는 것
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        // 만들어둔 HeroHeaderUiVIew 연결하기
        let headerView = HeroHeaderUiView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        getTrendingMovies()
        homeFeedTable.tableHeaderView = headerView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // 테이블 뷰가 항상 뷰의 전체 영역을 차지하도록
        homeFeedTable.frame = view.bounds
    }
    
    private func getTrendingMovies(){
        APICaller.shared.getTrendingMovies { _ in
            
        }
    }
}

// HomeViewController 클래스를 확장하여 UITableViewDelegate와 UITableViewDataSource 프로토콜을 채택
// 이 프로토콜은 HomeViewController 클래스가 UITableView 객체의 동작을 제어할 수 있도록 허용한다.
// - UITableView 객체의 행 수, 행의 텍스트, 행의 높이 등을 제어
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 이렇게 하면 각 섹션 위에 구분선을 둘 수 있음
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
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
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        // header의 텍스트를 왼쪽 20여백을 줌
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x+20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        // 텍스트들을 소문자로 변경한다.
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    // 각 섹션별 title을 sectionTitles로 지정한다.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    // scrollview를 아래로 스크롤 할 때, 네비바를 상단에 고정할 수 있다.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
