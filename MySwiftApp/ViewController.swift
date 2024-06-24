//
//  ViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/5.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let homeVC = HomeViewController()
        homeVC.tabBarItem.image =  UIImage(named: "Image-Tab-Salon-Inactive")
        homeVC.tabBarItem.selectedImage = UIImage(named: "Image-Tab-Salon-Active")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        homeVC.tabBarItem.title = "主页"
        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
        self.addChild(navigationHomeVC)

        let mineVC = MineViewController()
        mineVC.tabBarItem.image = UIImage(named: "Image-Tab-My-Inactive")
        mineVC.tabBarItem.selectedImage = UIImage(named: "Image-Tab-My-Active")?.withRenderingMode(.alwaysOriginal)
        mineVC.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.hexColor(0x333333)], for: .selected)
        mineVC.tabBarItem.title = "我的"
        let navigationMineVC = UINavigationController(rootViewController: mineVC)
        self.addChild(navigationMineVC)
        

    }

}
