//
//  ShowCardCell.swift
//  SingBa
//
//  Created by dongwei on 16/4/1.
//  Copyright © 2016年 com.myConpany.cn. All rights reserved.
//

import UIKit

class ShowCardCell: UICollectionViewCell {

    var headPhoto : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headPhoto = UIImageView(frame: frame)
        headPhoto.backgroundColor = UIColor.clearColor()
        headPhoto.image = UIImage(named: "load_default")
        self.addSubview(headPhoto)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
