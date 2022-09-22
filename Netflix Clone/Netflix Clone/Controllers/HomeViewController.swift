//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Hyung Seo Han on 2022/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeFeedTable: UITableView = {
        //tableVIew를 하나 만들고
        //frame -> initial location and size of the table view in its superview's coordinates
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*   systemBackground
        *    Use this stack for views with standard table views, and designs which have a white
        *    primary background in light mode.
        */
        view.backgroundColor = .systemBackground
        //Home View 안에 Sub View로써 homeFeedTable를 삽입
        view.addSubview(homeFeedTable)
        
        //델리게이트 설정
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        //homeFeedTable전체의 HeaderView 생성
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }
    
    //subView가 홈뷰에 띄워졌을 때 처리
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //view.bounds -> cover the whole bounds of screen
        homeFeedTable.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    //HomeFeedTable의 요소개수/섹션 개수 설정
    //section의 개수를 리턴해줌
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    //각 section별로 몇개의 row가 있는지 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //각각의 Table Cell에 대한 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //Cell의 Section에 대한 해더값 높이 지정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
     
}


/*
[tableView에 대한 delegate 추가적 설명]
 
 //각각의 Section의 Header값 리턴
 func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     //만약에 첫번째 section(index로는 0)이 선택되었다면
     //아래의 헤더 스트링으로 리턴
     if(section == 0){
         return("First Section")
     }
     return ("Hello World")
 }
 
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else{
         return UITableViewCell()
     }
     
     
     //만약에 첫번째 section(index로는 0)이 선택되었다면
     if(indexPath.section == 0){
         //만약에 해당 섹션의 첫번째 row(index로는 0)라면
         if(indexPath.row ==  0){
             cell.textLabel?.text = "This is First Row at First Section"
         }else{
             cell.textLabel?.text = "This is Second Row at First Section"
         }
         
     }
     return cell
 }
 */
