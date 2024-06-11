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
        let button = UIButton(type: .custom)
        button.setTitle("click", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didClick), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }

    @objc func didClick() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
