//
//  SecondViewController.swift
//  CustumerTabbar
//
//  Created by dongwei on 16/3/30.
//  Copyright © 2016年 com.dongwei.cn. All rights reserved.
//

import UIKit
import Alamofire

class ShowViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    private let CellIdentifier : String = "ShowCardCellIdentifier"
    private var collectionView : UICollectionView!
    private var showResult : NSArray!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blueColor()
        self.navigationItem.title = "精彩表演"
        
        showCollectionView()
        getShowData()
    }
    
    //初始化列表视图
    func showCollectionView(){
        //间隔距离
        let itemMargin : CGFloat = 5
        //item的宽和高
        let itemW : CGFloat = (SCRCREEN_WIDTH - CGFloat(itemMargin*2))/3
        //自定义layout布局
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //item的大小
        layout.itemSize = CGSize(width: itemW, height: itemW)
        //滚动方向
        layout.scrollDirection = .Vertical
        //item列的最小间距
        layout.minimumInteritemSpacing = 0
        //item行的最小间距
        layout.minimumLineSpacing = itemMargin
        
        //初始化UICollectionView
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView .registerClass(ShowCardCell.self, forCellWithReuseIdentifier: CellIdentifier)
        self.view.addSubview(collectionView)
    }
    
    
    //获取精彩表演数据
    func getShowData(){
        
        Alamofire.request(.GET, GetShowUrl).responseJSON ()
        {
            //服务器返回的数据
            response in
            
            //解析精彩表演数据
            let jsonData = response.result.value
            self.showResult = jsonData!["result"] as! NSArray
            // print("result is \(result)")//服务器返回数据
            
            self.collectionView.reloadData()
            if (self.showResult != nil)
            {
                for item in self.showResult as NSArray
                {
                    
                    print("user infor is \(item)")
                }
                
            }
        }
    }

    //collectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.showResult != nil)
        {
            return self.showResult.count
        }else
        {
            return 0
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView .dequeueReusableCellWithReuseIdentifier(CellIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}
