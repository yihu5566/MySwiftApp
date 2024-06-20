//
//  ViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/5.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     let homeVC =   HomeViewController()
        homeVC.tabBarItem.image = UIImage(named: "Image-Tab-Salon-Inactive")
        homeVC.tabBarItem.selectedImage = UIImage(named: "Image-Tab-Salon-Active")
        homeVC.tabBarItem.title = "首页"
      let navigationHomeVC =  UINavigationController(rootViewController: homeVC)
        self.addChild(navigationHomeVC)
        
        
        let mineVC =   MineViewController()
           mineVC.tabBarItem.image = UIImage(named: "Image-Tab-My-Inactive")
           mineVC.tabBarItem.selectedImage = UIImage(named: "Image-Tab-MY-Active")
           mineVC.tabBarItem.title = "我的"
         let navigationMineVC =  UINavigationController(rootViewController: mineVC)
           self.addChild(navigationMineVC)
           
         
    }

    @objc func didClick() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
