//
//  CustumerTabBarViewController.swift
//  SingBa
//
//  Created by dongwei on 16/3/29.
//  Copyright © 2016年 com.dongwei.cn. All rights reserved.
//

import UIKit

let tabBarItemCount : NSInteger     = 5
let tabBarItemW     : CGFloat       = SCRCREEN_WIDTH/5

let tabBarTag : Int = 1000

class CustumerTabBarViewController: UITabBarController {

    var tabBarBg : UIImageView?
    var itemImages : NSArray?
    var itemTitles : NSArray?
    
    var itemSelectImages : NSArray?
    var itemSelectTitles : NSArray?
    
    override func viewDidLoad() {

        self.view.backgroundColor = UIColor.whiteColor()
        self.tabBar.hidden = true
        
        //item图片数据
        itemImages = ["my_changba_tab_image","hottest_tab_image","ms_third_normal","chat_tab_image","discovery_tab_image"]
        //选中后的item图片样式
        itemSelectImages = ["my_changba_tab_image_selected","hottest_tab_image_selected","ms_third_selected","chat_tab_image_selected","discovery_tab_image_selected"]
        //item标题数据
        itemTitles = ["我的唱吧","精彩表演","唱歌","聊天","发现"]

        //创建背景图
        self.tabBarBackGround()
        //创建tabbarItem
        self.initTabBarItems()
        //tabbar加载控制器
        self.tabBarControllers()
        //刚开始默认选中第一个
        self.selectedIndex = 1
    }
    
    //背景（自定义)
    func tabBarBackGround(){
        tabBarBg = UIImageView(frame: CGRectMake(0,SCRCREEN_HEIGH-TabBar_HEIGH,SCRCREEN_WIDTH, TabBar_HEIGH))
        tabBarBg?.backgroundColor = UIColor.whiteColor()
        tabBarBg!.userInteractionEnabled=true
        self.view.addSubview(tabBarBg!)
        
        let tabBarLine = UIImageView(frame: CGRectMake(0,0,SCRCREEN_WIDTH,0.5))
        tabBarLine.backgroundColor = GolbalNormalColor
        tabBarBg?.addSubview(tabBarLine)
    }
    
    //自定义items
    func initTabBarItems(){
        let itemH = TabBar_HEIGH  - 10.0
        var itemX : CGFloat = 0.0
        let itemY : CGFloat = (TabBar_HEIGH - itemH)/2

        for var index :Int = 0; index < itemImages!.count; index++ {
            let itemFrame = CGRectMake(itemX, itemY, tabBarItemW, itemH)
            let itemView : TabBarItemView = TabBarItemView(frame:itemFrame)
            itemView.tag = index + tabBarTag
            itemView.userInteractionEnabled = true
            itemView.initItemSubViews(itemImages![index] as! String, title: itemTitles![index] as! String)
            tabBarBg?.addSubview(itemView)
            
            //添加手势
            let tap = UITapGestureRecognizer(target: self, action:Selector("selectedItem:"))
            tap.numberOfTapsRequired = 1
            itemView.addGestureRecognizer(tap)
            
            itemX += tabBarItemW
        }
    }
    
    //初始化controllers
    func tabBarControllers(){
        //首页
        let homeVC = RootViewController()
        let homeItem = UITabBarItem(tabBarSystemItem: .More, tag: 1)
        homeVC.tabBarItem = homeItem
        let homeNav = UINavigationController(rootViewController: homeVC)
        
        //精彩表演
        let actVC = ShowViewController()
        let actItem = UITabBarItem(tabBarSystemItem: .More, tag: 2)
        actVC.tabBarItem = actItem
        let actNav = UINavigationController(rootViewController: actVC)

        //唱歌
        let singVC = SingViewController()
        let singItem = UITabBarItem(tabBarSystemItem: .More, tag: 3)
        singVC.tabBarItem = singItem
        let singNav = UINavigationController(rootViewController: singVC)

        //聊天
        let chatVC = ChatViewController()
        let chatItem = UITabBarItem(tabBarSystemItem: .More, tag: 4)
        chatVC.tabBarItem = chatItem
        let chatNav = UINavigationController(rootViewController: chatVC)

        //发现
        let findVC = FindViewController()
        let findItem = UITabBarItem(tabBarSystemItem: .More, tag: 5)
        findVC.tabBarItem = findItem
        let findNav = UINavigationController(rootViewController: findVC)

        let tabbarViewControllers = [homeNav,actNav,singNav,chatNav,findNav]
        self .setViewControllers(tabbarViewControllers, animated: true)
    }
    
    //item点击事件
    func selectedItem(tap1:UITapGestureRecognizer){
        //先取消所有选中样式
        for var index :Int = 0; index < itemImages!.count; index++ {
            let itemView  = tabBarBg?.viewWithTag(index+tabBarTag) as! TabBarItemView
            itemView.normalItemWithImageName(itemImages![index] as! String)

        }
        //选中其中一个item
        let selectIndex : Int = (tap1.view?.tag)!
        let selectItemView = tabBarBg?.viewWithTag(selectIndex) as! TabBarItemView
        selectItemView.selectedItemWithImageName(itemSelectImages![selectIndex - tabBarTag] as! String)
        
        self.selectedIndex = selectIndex - tabBarTag

    }
    
}
