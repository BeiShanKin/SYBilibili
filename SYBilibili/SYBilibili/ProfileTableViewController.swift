//
//  ProfileTableViewController.swift
//  SYBilibili
//
//  Created by lz on 16/3/16.
//  Copyright © 2016year SY. All rights reserved.
//

import UIKit
import Foundation

class ProfileTableViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    lazy var modelStyle: UIButton = {
        let modelStyle = UIButton.init()
        modelStyle.tag = 10
        modelStyle.setImage(ColorManager.shareColorManager.themeStyle == "夜间模式" ? UIImage(imageLiteral: "ic_switch_night") : UIImage(imageLiteral: "ic_switch_daily"), forState: .Normal)
        modelStyle.addTarget(self, action: "modelStyleButtonDown:", forControlEvents: .TouchUpInside)
        return modelStyle
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: WindowH * 0.275))
        headerView.backgroundColor = ColorManager.shareColorManager.colorWithString("themeColor")
        return headerView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.separatorStyle = .None
        tableView.tableHeaderView = self.headerView
        tableView.tableHeaderView!.addSubview(self.modelStyle)
        self.modelStyle.snp_makeConstraints { (make) -> Void in
            
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    //MARK: - ClickMethod
    func modelStyleButtonDown(sender: UIButton) {
        
    }
}
