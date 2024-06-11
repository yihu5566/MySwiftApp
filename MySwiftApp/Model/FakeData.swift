//
//  FakeData.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/7.
//

import Foundation

class FakeData {
    private static var bannerList = [String]()
    private static var products = [Product]()
    private static var deals = [Deal]()

    static func creatBanners() -> [String] {
        if bannerList.count == 0 {
            bannerList = ["https://www.wanandroid.com/blogimgs/42da12d8-de56-4439-b40c-eab66c227a4b.png", "https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png"]
        }
        return bannerList
    }

    static func creatProdects() -> [Product] {
        if products.count == 0 {
            let p1 = Product(imageUrl: "https://www.wanandroid.com/blogimgs/2f859d26-e80a-4f08-a62a-f1c8236333cf.png",
                             name: "开源项目主Tab", price: 1, desc: "描述一", teacher: "张一", total: 20,
                             update: 1, student: 11, detail: "项目详情", courseList: "卡爱篇次")
            let p2 = Product(imageUrl: "https://www.wanandroid.com/blogimgs/89868c9a-e793-46f3-a239-751246951b7f.png",
                             name: "开源项目主Tab", price: 1, desc: "描述一", teacher: "二", total: 20,
                             update: 1, student: 11, detail: "项目详情", courseList: "卡爱篇次")
            let p3 = Product(imageUrl: "https://www.wanandroid.com/resources/image/pc/default_project_img.jpg",
                             name: "开源项目主Tab", price: 1, desc: "描述一", teacher: "张三", total: 20,
                             update: 1, student: 11, detail: "项目详情", courseList: "卡爱篇次")
            let p4 = Product(imageUrl: "https://www.wanandroid.com/blogimgs/2f859d26-e80a-4f08-a62a-f1c8236333cf.png",
                             name: "开源项目主Tab", price: 1, desc: "描述一", teacher: "张四", total: 20,
                             update: 1, student: 11, detail: "项目详情", courseList: "卡爱篇次")
            products = [p1, p2, p3, p4]
        }
        return products
    }

    static func createDeals() -> [Deal] {
        if deals.count == 0 {
            deals = FakeData.creatProdects().map {
                Deal(prodect: $0, progress: 1)
            }
        }
        return deals
    }
}
