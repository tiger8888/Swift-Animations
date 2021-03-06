//
//  MoreInfoView.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

class MoreInfoView: UIView {
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame : frame)
        
        layer.borderWidth   = 0.5
        layer.borderColor   = UIColor.blackColor().CGColor
        layer.masksToBounds = true
        
        /*
         *     --------------     *
         *-50->|-view-width-|<-50-*
         *     --------------     *
         */
        let rect              = frame
        imageView             = UIImageView(frame: CGRectMake(-50, 0, rect.size.width + 50 * 2, rect.size.height))
        imageView.contentMode = .ScaleAspectFill
        self.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
