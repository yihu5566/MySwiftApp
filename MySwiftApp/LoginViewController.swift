//
//  LoginViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/7.
//

import Foundation
import SnapKit
import UIKit

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

protocol ValidatesPassword {
    func validatePassword(_ password: String) -> Bool
}

extension ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatesPassword {
    func validatePassword(_ password: String) -> Bool {
        if password.count < 6 || password.count > 12 {
            return false
        }
        return true
    }
}

class LoginViewController: BaseViewController,ValidatesPhoneNumber,ValidatesPassword {
    var phoneTextField: UITextField!

    var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let logoView = UIImageView(image: R.image.main_tab())
        view.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        let phoneIconView = UIImageView(image: R.image.phone())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftView?.backgroundColor = UIColor.green
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        // set location
        phoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }

        let passwordIconView = UIImageView(image: R.image.password())
        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView?.backgroundColor = UIColor.green
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        // set location
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }

        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//        loginButton.setBackgroundImage(UIColor.hexColor(0x0F2F30).toImage(), for: .normal)
        loginButton.backgroundColor = UIColor.hexColor(0x0F2F30)
        view.addSubview(loginButton)

        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }

        loginButton.addTarget(self, action: #selector(didClickLoginButtton), for:.touchUpInside)
    }

    @objc func didClickLoginButtton() {
        let alertVC = UIAlertController(title: "提示", message: "用户名或密码错误", preferredStyle: .alert)
        present(alertVC, animated: true,completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
            alertVC.dismiss(animated: true,completion: nil)
        }
        
    }
}
