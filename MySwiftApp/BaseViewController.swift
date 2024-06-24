//
//  BaseViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/7.
//

import Foundation
import UIKit
class BaseViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.hexColor(0xdfdfdf)
//        // 设置底部和顶部栏背景色为白色
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        self.tabBarController?.tabBar.barTintColor = UIColor.white
//        
        // 设置底部和顶部栏延伸到安全区域
        let edges = UIRectEdge.bottom.union(.top)
        self.edgesForExtendedLayout = edges

    }
}
