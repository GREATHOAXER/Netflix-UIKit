//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Hyung Seo Han on 2022/09/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    
    //각각의 Row별로 들어가는 콘텐츠(즉 collectionView)를 표현하는 View
    private let collectionView: UICollectionView = {
        //UICollectionViewFlowLayout -> 컬렉션 뷰에 대한 레이아웃 정보 생성위한 추상적 클래스
        let layout = UICollectionViewFlowLayout()
        //각각의 CollectionViewCell의 layout 설정
        layout.itemSize = CGSize(width: 140, height: 200)
        //세로로 하기 때문에 스크롤 방향을 horizontal로 설정
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Cell 전체의 BackgroundColor
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder:NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        
        return cell
    }
    
    //하나의 Cell안에 몇개의 아이템이 들어갈 지 리턴
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
