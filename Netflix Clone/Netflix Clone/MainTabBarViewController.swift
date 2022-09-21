//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Hyung Seo Han on 2022/09/22.
//

import UIKit

//Tabbar로 만들기 위해선 UITabBarController를 Subclass로 두어야함
//이렇게 하면 View에서 아래 Tabbar를 위한 공간이 나오게 됨
class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
        
        //각각의 Tabview마다 네비게이션 컨트롤러를 설정
        //왜냐하면 각각의 탭뷰마다 들어가는 뷰가 다르기 때문에
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        //각각의 Tabview의 Tabbar 아이템을 설정함
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        //각각의 Tabbar의 타이틀 설정
        vc1.title = "Home"
        vc2.title = "Coming soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

