//
//  Tab.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/21.
//

import Foundation
import SnapKit
import UIKit

class Tab: UIView {
    var items: [String]
    var itemButtons: [UIButton]!
    var selectItemButton: UIButton!

    var indicatorView: UIView!

    var selectedColor: UIColor? {
        didSet {
            if let color = selectedColor {
                indicatorView.backgroundColor = color
                itemButtons.forEach { button in
                    button.setTitleColor(color, for: .selected)
                }
            } else {
                indicatorView.backgroundColor = UIColor.hexColor(0xF8892E)
                itemButtons.forEach { button in
                    button.setTitleColor(UIColor.hexColor(0xF8892E), for: .selected)
                }
            }
        }
    }

    var normalColor: UIColor?

    init?(items: [String]) {
        if items.isEmpty {
            return nil
        }
        self.items = items
        itemButtons = []
        super.init(frame: .zero)
//        self.backgroundColor = UIColor.gray
        createViews()
    }

    private func createViews() {
        var lastView: UIView?
        for index in 0 ..< items.count {
            let button = UIButton(type: .custom)
            button.setTitle(items[index], for: .normal)
            button.setTitleColor(UIColor.hexColor(0x333333), for: .normal)
            button.setTitleColor(UIColor.hexColor(0xF8892E), for: .selected)
            self.addSubview(button)

            if index == 0 {
                selectItemButton = button
            }
            button.snp.makeConstraints { make in
                if index == 0 {
                    make.left.equalToSuperview()
                } else {
                    make.left.equalTo(lastView!.snp.right)
                    make.width.equalTo(lastView!)
                }
                make.top.bottom.equalToSuperview()
                if index == items.count - 1 {
                    make.right.equalToSuperview()
                }
            }
            lastView = button
            button.addTarget(self, action: #selector(didClickButton(sender: )), for: .touchUpInside)
            itemButtons.append(button)
        }

        indicatorView = UIView()
        indicatorView.backgroundColor = UIColor.hexColor(0xF8892E)
        self.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.centerX.equalTo(selectItemButton)
            make.bottom.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(4)
        }
    }

    @objc func didClickButton(sender: UIButton) {
        guard sender != selectItemButton else {
            return
        }

        selectItemButton.isSelected = false
        sender.isSelected = true
        selectItemButton = sender
        UIView.animate(withDuration: 3) {
            self.indicatorView.snp.remakeConstraints { make in
                make.centerX.equalTo(self.selectItemButton)
                make.bottom.equalToSuperview()
                make.width.equalTo(80)
                make.height.equalTo(4)
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
