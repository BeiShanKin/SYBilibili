//
//  ColorExtension.swift
//  SYBilibili
//
//  Created by lz on 16/3/16.
//  Copyright © 2016年 SY. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func colorWithHex(hex: Int,alpha: CGFloat) -> UIColor {
        let red = (CGFloat((hex & 0xff0000) >> 16) / 255.0)
        let green = (CGFloat((hex & 0xff00) >> 8) / 255.0)
        let blue = CGFloat(hex & 0xff) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}