//
//  DetailViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/21.
//

import Foundation
import Kingfisher
import SnapKit
import UIKit

class DetailViewController: BaseViewController {
    var product: Product!
    var avaterView: UIImageView!
    var nameLable: UILabel!
    var descLable: UILabel!
    var teacherLable: UILabel!
    var courseCountLable: UILabel!
    var studentCountLable: UILabel!
    var tab: Tab!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "详情"
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.configureWithOpaqueBackground()
//        navBarAppearance.backgroundColor = .gray // 设置导航栏背景色
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white] // 设置导航栏标题颜色
//
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        
        createTop()
        createMiddle()
        createBottom()
    }

    func createTop() {
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
        avaterView.kf.setImage(with: URL(string: product.imageUrl), placeholder: nil, options: [.processor(round)])
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

        let bookAtttachment = NSTextAttachment()
        bookAtttachment.image = R.image.icon_phone()
        bookAtttachment.bounds = CGRect(x: -2, y: -3, width: bookAtttachment.image?.size.width ?? 20 / 2, height: (bookAtttachment.image?.size.height ?? 20) / 2)

        let bookAtttachmentString = NSAttributedString(attachment: bookAtttachment)
        let courseCountString = NSMutableAttributedString(string: "")
        courseCountString.append(bookAtttachmentString)

        let courseCountStringAfterIcon = NSAttributedString(string: " 共 \(product.total) 讲 更新至 \(product.update) 讲 ")

        courseCountString.append(courseCountStringAfterIcon)

        courseCountLable = UILabel(frame: .zero)
        courseCountLable.textColor = .white
        courseCountLable.font = UIFont.systemFont(ofSize: 14)
        courseCountLable.attributedText = courseCountString

        topView.addSubview(courseCountLable)
        courseCountLable.snp.makeConstraints { make in
            make.left.equalTo(topView).offset(20)
            make.bottom.equalTo(topView).offset(-20)
        }
//        学生lab

        let studentAtttachment = NSTextAttachment()
        studentAtttachment.image = R.image.icon_password()
        studentAtttachment.bounds = CGRect(x: -2, y: -3, width: bookAtttachment.image?.size.width ?? 20 / 2, height: (bookAtttachment.image?.size.height ?? 20) / 2)

        let studentAtttachmentString = NSAttributedString(attachment: studentAtttachment)
        let studentCountString = NSMutableAttributedString(string: "")
        studentCountString.append(studentAtttachmentString)

        let studentCountStringAfterIcon = NSAttributedString(string: " 共 \(product.total) 人学习 ")

        studentCountString.append(studentCountStringAfterIcon)

        studentCountLable = UILabel(frame: .zero)
        studentCountLable.textColor = .white
        studentCountLable.font = UIFont.systemFont(ofSize: 14)
        studentCountLable.attributedText = studentCountString

        topView.addSubview(studentCountLable)
        studentCountLable.snp.makeConstraints { make in
            make.left.equalTo(studentCountLable)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalTo(topView).offset(-20)
        }
    }

    func createMiddle() {
        tab = Tab(items: ["课程介绍", "课程目录"])
        view.addSubview(tab)
        tab.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(200)
            make.height.equalTo(50)
        }
    }

    func createBottom() {
        let button = UIButton(type: .custom)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitle("购买 ¥\(product.price)", for: .normal)
        button.setBackgroundImage(UIColor.hexColor(0xF8892E).toImage(), for: .normal)
        button.addTarget(self, action: #selector(didClickBuyButton), for: .touchUpInside)
        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
    }

    @objc func didClickBuyButton() {
        let loginVc = LoginViewController()
        navigationController?.pushViewController(loginVc, animated: true)
    }
}
