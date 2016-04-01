//
//  TabBarItemView.swift
//  SingBa
//
//  Created by dongwei on 16/3/29.
//  Copyright © 2016年 com.dongwei.cn. All rights reserved.
//

import UIKit

class TabBarItemView: UIView {

    var itemImage  : UIImageView?   //图片
    var titleLable : UILabel?       //标题
    //初始化子视图
    func initItemSubViews(imageName:String, title:String)
    {
        let itemFrame = self.frame
        let itemTitleH :CGFloat = 20
        let itemImageH :CGFloat = itemFrame.size.height - itemTitleH
        
        let itemImageFrame = CGRectMake(0,5, tabBarItemW, itemImageH)
        let itemTitleFrame = CGRectMake(0,itemImageH+7, tabBarItemW, itemTitleH)

        //自定义图片
        itemImage = UIImageView(frame: itemImageFrame)
        itemImage!.contentMode = UIViewContentMode.Center
        itemImage!.image = UIImage(named: imageName)
        self.addSubview(itemImage!)

        //自定义标题
        titleLable  = UILabel(frame: itemTitleFrame)
        titleLable!.textAlignment = NSTextAlignment.Center;
        titleLable!.font = UIFont.systemFontOfSize(10)
        titleLable!.text = title
        titleLable!.textColor = GolbalNormalColor
        self.addSubview(titleLable!)
    }
    
    //普通item样式
    func normalItemWithImageName(imageName : String){
        itemImage!.image = UIImage(named: imageName)
        titleLable!.textColor = GolbalNormalColor
    }
    
    //点击某一个item
    func selectedItemWithImageName(imageName : String){
        itemImage!.image = UIImage(named: imageName)
        titleLable!.textColor = UIColor(red: 0.92, green: 0.31, blue: 0.27, alpha: 1)
    }
   
}
