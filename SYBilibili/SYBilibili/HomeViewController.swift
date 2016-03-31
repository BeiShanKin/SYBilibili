//
//  HomeViewController.swift
//  SYBilibili
//
//  Created by lz on 16/3/7.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    lazy var panGest: UIPanGestureRecognizer = {
       let panGest = UIPanGestureRecognizer(target: self, action:"panMove:")
        return panGest
    }()
    
    lazy var profileView: UIView = {
        var rect = self.view.frame
        rect.size.width = rect.size.width * BackViewScale
        rect.origin.x = -rect.size.width
        let profileView: UIView = UIView.init(frame: rect)
        profileView.backgroundColor = UIColor.redColor()
        self.view.addSubview(profileView)
        return profileView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
        // 设置导航栏左边按钮
        let leftImage = UIImage(imageLiteral: "ic_drawer_home")
        let leftBtn = UIButton(type: .Custom)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 30, height: leftImage.size.height)
        leftBtn.addTarget(self, action: "leftClick:", forControlEvents: .TouchUpInside)
        leftBtn.setImage(leftImage.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
        
        // 设置导航栏右边按钮
        let rightImage = UIImage(imageLiteral: "ic_toolbar_menu_search")
        let rightBtn = UIButton(frame:CGRect(x: 0,y: 0,width: rightImage.size.width,height: rightImage.size.height))
        rightBtn.addTarget(self, action: "rightClick:", forControlEvents: .TouchUpInside)
        rightBtn.setImage(rightImage.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal);
        rightBtn.contentMode = .Right
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        
        let panView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: self.view.frame.size.height))
        panView.addGestureRecognizer(self.panGest)
        self.view.addSubview(panView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        getNetInfo("http://www.bilibili.com/index/bangumi/58163.json", params:nil) { (responseObjc) -> Void in
            print("\(responseObjc)");
        };
    }
    
    //MARK: -点击方法
    func leftClick(item: UIBarButtonItem) {
        NSLog("摊开一个侧框");
    }
    
    func rightClick(item: UIBarButtonItem) {
        NSLog("搜索栏弹出");
    }
    
    //MARK: -手势滑动方法
    func panMove(gest: UIPanGestureRecognizer) {
        NSLog("手势滑动触动啦------%f",gest.locationInView(nil).x);
    }
}
