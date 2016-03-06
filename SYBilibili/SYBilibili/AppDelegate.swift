//
//  AppDelegate.swift
//  SYBilibili
//
//  Created by lz on 16/3/6.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var arr: [UIImage] = {
        var tmpArr = [UIImage]()
        for i in 0...67
        {
            let imageName = String.localizedStringWithFormat("ic_splash_icon_000%02d.png", i)
            print(imageName)
            let path: String = NSBundle.mainBundle().pathForResource(imageName, ofType: nil)!
            let image = UIImage.init(contentsOfFile: path)
            tmpArr.append(image!)
        }
        return tmpArr
    }()
    
    lazy var imageView: UIImageView = {
        let tmpImageView = UIImageView.init(image: UIImage.init(named: "ic_splash_icon_00067"))
        var point: CGPoint = self.window!.center
        point.y = self.window!.frame.size.height - 50
        tmpImageView.center = point
        tmpImageView.animationImages = self.arr
        tmpImageView.animationDuration = 68*0.029
        tmpImageView.animationRepeatCount = 1
        tmpImageView.startAnimating()
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(tmpImageView.animationDuration * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue(), { () -> Void in
            self.animationEnd()
        })
        return tmpImageView
    }()
    
    lazy var view: UIView = {
        let tmpView = UIView.init(frame: self.window!.frame)
        tmpView.backgroundColor = UIColor.whiteColor()
        tmpView.addSubview(self.imageView)
        return tmpView
    }()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window?.makeKeyAndVisible()
        self.window?.addSubview(self.view)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS m- ssage) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - 内部方法 
    func animationEnd() {
        self.arr.removeAll(keepCapacity:false)
        weak var weakSelf = self
        UIView.animateWithDuration(0.8, animations:
            { [weak self] in
            self?.view.alpha = 0
            })
            { (finished) -> Void in
                weakSelf?.view.removeFromSuperview()
        }
    }
}

