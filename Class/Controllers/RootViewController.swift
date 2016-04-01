//
//  RootViewController.swift
//  CustumerTabbar
//
//  Created by dongwei on 16/3/29.
//  Copyright © 2016年 com.dongwei.cn. All rights reserved.
//
//

import UIKit
import Alamofire

let ButtonW :CGFloat = 40
let ButtonH :CGFloat = 80

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "首页"
        self.view.backgroundColor = UIColor.whiteColor();
        
        let button :UIButton = UIButton(type: .Custom)
        button.frame = CGRectMake((SCRCREEN_WIDTH-ButtonH)/2,(SCRCREEN_WIDTH-ButtonW)/2, ButtonH, ButtonW)
        button .setTitle("button", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        button.layer.cornerRadius = 8
//        self.view.addSubview(button)
        
//        getHomeData()
    }

    func getHomeData(){
        
        Alamofire.request(.GET, GetShowUrl).responseJSON () {
            
            response in

            //解析数据
            let jsonData = response.result.value
            let result = jsonData!["result"]
//            print("result is \(result)")//服务器返回数据

            if (result != nil){
                for item in result as! NSMutableArray
                {
                    
                print("user infor is \(item)")
                }
                
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

}
