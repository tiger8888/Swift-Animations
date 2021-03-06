//
//  UIFont+extension.swift
//  Swift-Animations
//
//  Created by YouXianMing on 16/8/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

import UIKit

extension UIFont {

    class func AppleSDGothicNeoThin(value : CGFloat) -> UIFont! {
        
        return self.init(name : "AppleSDGothicNeo-Thin", size: value)
    }
    
    class func Avenir(value : CGFloat) -> UIFont! {
        
        return self.init(name : "Avenir", size: value)
    }
    
    class func AvenirLight(value : CGFloat) -> UIFont! {
        
        return self.init(name : "Avenir-Light", size: value)
    }
    
    class func HeitiSC(value : CGFloat) -> UIFont! {
        
        return self.init(name : "Heiti SC", size: value)
    }
    
    class func HelveticaNeueThin(value : CGFloat) -> UIFont! {
        
        return self.init(name : "HelveticaNeue-Thin", size: value)
    }
}
