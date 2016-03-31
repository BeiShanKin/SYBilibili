//
//  ColorManager.swift
//  SYBilibili
//
//  Created by lz on 16/3/16.
//  Copyright © 2016年 SY. All rights reserved.
//

import Foundation
import UIKit

class ColorManager: NSObject {
    
    static let shareColorManager = ColorManager()
    
    lazy var themeStyle: String = {
        var themeStyle: String?
        themeStyle = NSUserDefaults.standardUserDefaults().valueForKey("themeStyle") as? String
        if (themeStyle == nil) {
            themeStyle = "少女粉"
        }
        return themeStyle!
    }()
    
    lazy var colorDict: NSDictionary = {
        let colorDict = NSDictionary.init(contentsOfFile: NSBundle.mainBundle().pathForResource("theme", ofType: "plist")!)
        return colorDict!
    }()
    
    func colorWithString(str: String) -> UIColor {
        return getColorWithString(str, alpha: 1.0)
    }
    
    func getColorWithString(colorStr: String,alpha: CGFloat) -> UIColor {
        return getthemeColor(self.themeStyle, colorStr: colorStr, alpha: alpha)
    }
    
    func getthemeColor(theme: String, colorStr: String,alpha: CGFloat) -> UIColor {
        let hex = self.colorDict[theme]?.valueForKey(colorStr)!.integerValue
        return UIColor.colorWithHex(hex!, alpha: alpha)
    }
}
