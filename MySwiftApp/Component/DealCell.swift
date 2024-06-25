//
//  DealCell.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/25.
//

import Foundation
import UIKit
import SnapKit

class DealCell: CommonListCell<Deal> {
    let progressLable: UILabel
    let productImageView: UIImageView

    override var item: Deal? {
        didSet {
            if let p = self.item {
                self.productImageView.kf.setImage(with: URL(string: p.prodect.imageUrl))
                self.textLabel?.text = p.prodect.name
                self.detailTextLabel?.text = p.prodect.desc
                self.progressLable.text = "已经学习 \(p.progress) %"
            }
        }
    }

    required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        progressLable = UILabel(frame: .zero)
        productImageView = UIImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        textLabel?.textColor = UIColor.hexColor(0x333333)
        detailTextLabel?.textColor = UIColor.hexColor(0x999999)
        detailTextLabel?.numberOfLines = 2
        progressLable.textColor = UIColor.hexColor(0x333333)
        progressLable.font = UIFont.systemFont(ofSize: 20)

        contentView.addSubview(progressLable)
        contentView.addSubview(productImageView)

        productImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(30)
            make.top.equalTo(contentView).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(100)
        }
        textLabel?.snp.makeConstraints({ make in
            make.left.equalTo(productImageView.snp.right).offset(12)
            make.top.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
        progressLable.snp.makeConstraints { make in
            make.left.equalTo(textLabel!)
            make.centerY.equalTo(contentView)
        }

        detailTextLabel?.snp.makeConstraints({ make in
            make.left.equalTo(textLabel!)
            make.bottom.equalTo(productImageView)
            make.right.equalTo(contentView).offset(-20)
        })
    }
}
