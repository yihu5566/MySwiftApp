//
//  DealListViewController.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/25.
//

import Foundation

class DealListViewController: BaseViewController ,CommonListDelegate{
    func didSelectItem<Item>(_ item: Item) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let dealList = CommonList<Deal,DealCell>(frame: .zero)
        dealList.items = FakeData.createDeals()
        dealList.delegate = self
        view.addSubview(dealList)
        dealList.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
