//
//  HomeView.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/20.
//

import Foundation
import Kingfisher
import UIKit

class HomeViewController: BaseViewController, BannerViewDelegate, BannerViewDataSource, CommonListDelegate {
    func didSelectItem<Item>(_ item: Item) {
        if let item = item as? Product {
            let detailVC = DetailViewController()
            detailVC.product = item
            detailVC.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
  

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hidesBottomBarWhenPushed = false
    }

    func numberOfBanners(_ bannerView: BannerView) -> Int {
        return FakeData.creatBanners().count
    }

    func viewForBanner(_ bannerView: BannerView, index: Int, coverView: UIView?) -> UIView {
        if let view = coverView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.creatBanners()[index]))
            return view
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.creatBanners()[index]))
            return imageView
        }
    }

    func didSelectBanner(_ bannerView: BannerView, index: Int) {
        print("index--->", index)
    }

    var topPadding : CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let topPadding = windowScene.statusBarManager?.statusBarFrame.height {
//            self.topPadding = topPadding
//        }
        self.view.backgroundColor = .white

        let bannerView = BannerView(frame: CGRect(x: 0, y: topPadding, width: UIScreen.main.bounds.width, height: 173))
        bannerView.autoScrollInterval = 2
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)

        let productList = CommonList<Product,ProductCell>(frame: .zero)
        productList.items = FakeData.creatProdects()
        productList.delegate = self
        view.addSubview(productList)
        productList.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp.bottom).offset(5)
        }
    }
}
