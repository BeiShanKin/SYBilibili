//
//  BaseViewController.swift
//  SYBilibili
//
//  Created by lz on 16/3/7.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    func getNetInfo(URL: String , params: [String : String]?, success:((responseObjc: AnyObject) -> Void)) {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession.init(configuration: configuration)
        let request = NSMutableURLRequest.init(URL: NSURL.init(string: URL)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if ((params) != nil) {
            request.HTTPMethod = "POST"
        } else {
            request.HTTPMethod = "GET"
        }
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
//            let string = String.init(data: data!, encoding: NSUTF8StringEncoding)
            do {
                let responseObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves)
                success(responseObjc : responseObject)
            } catch {}
        }
        task.resume()
    }
}
