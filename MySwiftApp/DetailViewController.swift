//
//  DetailViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/21.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class DetailViewController: BaseViewController {
    
    var product:Product!
    var avaterView:UIImageView!
    var nameLable:UILabel!
    var descLable:UILabel!
    var teacherLable:UILabel!
    var courseCountLable:UILabel!
    var studentCountLable:UILabel!
    var tab:Tab!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "详情"
        createTop()
        createMiddle()
        createBottom()
    }
    
    func createTop()  {
        let topView = UIView()
        topView.layer.contents = R.image.testJpeg()?.cgImage
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.layer.masksToBounds = true
        blurView.alpha = 0.7
        blurView.frame = topView.bounds
        view.addSubview(topView)
        topView.addSubview(blurView)
        blurView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(180)
        }
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(180)
        }
        avaterView = UIImageView()
        let round = RoundCornerImageProcessor(cornerRadius: 10)
        avaterView.kf.setImage(with: URL(string: product.imageUrl),placeholder: nil,options: [.processor(round)])
        topView.addSubview(avaterView)
        avaterView.snp.makeConstraints { make in
            make.left.top.equalTo(topView).offset(20)
            make.width.equalTo(82)
            make.height.equalTo(108)
        }
        nameLable = UILabel(frame: .zero)
        nameLable.textColor = .white
        nameLable.font = UIFont.boldSystemFont(ofSize: 18)
        nameLable.text = product.name
        topView.addSubview(nameLable)
        nameLable.snp.makeConstraints { make in
            make.left.equalTo(avaterView.snp.right).offset(10)
            make.top.equalTo(avaterView)
            make.right.equalTo(topView).offset(-15)
        }
        descLable = UILabel(frame: .zero)
        descLable.textColor = .white
        descLable.font = UIFont.boldSystemFont(ofSize: 14)
        descLable.text = product.desc
        descLable.numberOfLines = 2
        topView.addSubview(descLable)
        descLable.snp.makeConstraints { make in
            make.left.equalTo(avaterView.snp.right).offset(20)
            make.top.equalTo(nameLable.snp.bottom).offset(5)
            make.right.equalTo(topView).offset(-15)
        }
        
        teacherLable = UILabel(frame: .zero)
        teacherLable.textColor = .white
        teacherLable.font = UIFont.boldSystemFont(ofSize: 14)
        teacherLable.text = "讲师：\(product.teacher)"
        topView.addSubview(teacherLable)
        teacherLable.snp.makeConstraints { make in
            make.left.equalTo(avaterView.snp.right).offset(20)
            make.bottom.equalTo(avaterView)
            make.right.equalTo(topView).offset(-15)
        }
        
        
        
    }
    func createMiddle()  {
        tab = Tab(items: ["课程介绍","课程目录"])
        view.addSubview(tab)
        tab.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(200)
            make.height.equalTo(50)
        }
        
    }
    func createBottom()  {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("购买 ¥\(product.price)", for: .normal)
        button.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        button.addTarget(self, action: #selector(didClickBuyButton), for: .touchUpInside)
        view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        
    }
    
    @objc func didClickBuyButton()  {
        let loginVc = LoginViewController()
        navigationController?.pushViewController(loginVc, animated: true)
    }
}
