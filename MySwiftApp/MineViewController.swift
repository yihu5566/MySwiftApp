//
//  MineViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/20.
//

import Foundation
import UIKit

class MineViewController: BaseViewController {
    var accountCell: CommonCell!
    var purchasedCell: CommonCell!
    var dealCell: CommonCell!
    var groupCell: CommonCell!

    var avatarView: UIImageView!
    
    var topPadding : CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()     
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let topPadding = windowScene.statusBarManager?.statusBarFrame.height {
//            self.topPadding = topPadding
//        }
        self.view.backgroundColor = .white
        self.creatTopViews()
        self.creatFirstGroupCells()
    }
    func creatTopViews()  {
        let topView = UIView(frame: .zero)
        topView.backgroundColor = .white
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(topPadding)
            make.left.right.equalToSuperview()
            make.height.equalTo(160)
        }
        avatarView = UIImageView(image: R.image.testJpeg())
        avatarView.layer.cornerRadius = 60
        avatarView.layer.masksToBounds = true
        topView.addSubview(avatarView)
        avatarView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.height.width.equalTo(120)
        }
        
        let button = UIButton(type: .custom)
        button.setTitle("点击登录", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
        button.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        topView.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalTo(avatarView.snp.right).offset(20)
            make.top.equalTo(avatarView).offset(20)
        }
        
    }
    @objc func didClickLoginButton(){
        let LoginVC = LoginViewController()
        LoginVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(LoginVC, animated: true)
    }
    
    func creatFirstGroupCells()  {
        accountCell = CommonCell()
        accountCell.icon = R.image.ic_active_calendar()
        accountCell.title = "账户"
        view.addSubview(accountCell)
        accountCell.snp.makeConstraints { make in
            make.top.equalTo(self.avatarView.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        
        purchasedCell = CommonCell()
        purchasedCell.icon = R.image.ic_active_calendar()
        purchasedCell.title = "已经购买"
        purchasedCell.addTarget(self, action: #selector(didClickDealButton), for: .touchUpInside)
        view.addSubview(purchasedCell)
        purchasedCell.snp.makeConstraints { make in
            make.top.equalTo(self.accountCell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        dealCell = CommonCell()
        dealCell.icon = R.image.ic_active_calendar()
        dealCell.title = "商城订单"
        view.addSubview(dealCell)
        dealCell.snp.makeConstraints { make in
            make.top.equalTo(self.purchasedCell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
        groupCell = CommonCell()
        groupCell.icon = R.image.ic_active_calendar()
        groupCell.title = "我的拼团"
        view.addSubview(groupCell)
        groupCell.snp.makeConstraints { make in
            make.top.equalTo(self.dealCell.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(55)
        }
        
    }
    
    @objc func didClickDealButton(){
        let LoginVC = DealListViewController()
        LoginVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(LoginVC, animated: true)
    }
}
