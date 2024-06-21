//
//  UIColor.swift
//  MySwiftApp
//
//  Created by dongfang lu on 2024/6/7.
//

import Foundation
import UIKit
extension UIColor {
    static func hexColor(_ hexValue: Int, alphaValue: Float) -> UIColor {
        let red = CGFloat((hexValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((hexValue & 0x00FF00) >> 8) / 255
        let blue = CGFloat(hexValue & 0x0000FF) / 255
        let alpha = CGFloat(alphaValue)

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    static func hexColor(_ hexValue: Int) -> UIColor {
        return hexColor(hexValue, alphaValue: 1)
    }

    convenience init(_ hexValue: Int, alphaValue: Float) {
        self.init(red: CGFloat(((hexValue & 0xFF0000) >> 16) / 255), green: CGFloat(((hexValue & 0x00FF00) >> 16) / 255), blue: CGFloat(((hexValue & 0x0000FF) >> 16) / 255), alpha: CGFloat(alphaValue))
    }

    convenience init(_ hexValue: Int) {
        self.init(hexValue, alphaValue: 1)
    }

    func toImage() -> UIImage {
        // 定义图像尺寸
        let imageSize = CGSize(width: 300, height: 100)

        // 开始图像上下文
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(cgColor)
        context?.fill(CGRect(origin: .zero, size: imageSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        return image!
    }
}
