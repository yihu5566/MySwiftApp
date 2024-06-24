//
//  CommonCell.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/24.
//

import Foundation
import UIKit

class CommonCell: UIControl {
    var title: String? {
        didSet {
            titleView.text = title
        }
    }

    var icon: UIImage? {
        didSet {
            iconView.image = icon
        }
    }

    var titleView: UILabel
    var iconView: UIImageView
    var bottomLine: UIView
    var arrowView: UIImageView

    var hilightView: UIView

    override init(frame: CGRect) {
        titleView = UILabel()
        iconView = UIImageView()
        bottomLine = UIView()
        arrowView = UIImageView(image: R.image.icon_arrow_right())
        hilightView = UIView()
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }

    func setupView() {
        addSubview(hilightView)
        hilightView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        hilightView.isHidden = true
        hilightView.alpha = 0 
        hilightView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        addSubview(iconView)
    
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(22)
        }

        addSubview(titleView)
        titleView.textColor = UIColor.hexColor(0x333333)
        titleView.font = UIFont.systemFont(ofSize: 15)

        titleView.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(10)
            make.center.equalToSuperview()
        }

        addSubview(arrowView)
        arrowView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(22)
            make.width.equalTo(12)
        }

        addSubview(bottomLine)
        bottomLine.backgroundColor = UIColor(white: 0.95, alpha: 1)
        bottomLine.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(1 / UIScreen.main.scale)
        }
    }

    override var isHighlighted: Bool {
        didSet {
            super.isHighlighted = self.isHighlighted
            if self.isHighlighted {
                self.hilightView.alpha = 1
                self.hilightView.isHidden = false
            } else {
                UIView.animate(withDuration: 0.5, animations: {
                    self.hilightView.alpha = 0
                }) { _ in
                    self.hilightView.isHidden = true
                }
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
