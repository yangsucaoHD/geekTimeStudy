//
//  UIBarButtonItem+extension.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/17.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    class func createBarItem(imgName:String, highlightedImgName:String, size:CGSize) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), for: .normal)
        btn.setImage(UIImage(named: highlightedImgName), for: .highlighted)
        if size != CGSize.zero {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        } else {
            btn.sizeToFit()
        }
        
        return UIBarButtonItem(customView: btn)
    }
    
    convenience init(imgName:String, highlightedImgName:String = "", size:CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setImage(UIImage(named: imgName), for: .normal)
        if highlightedImgName.count > 0 {
            btn.setImage(UIImage(named: highlightedImgName), for: .highlighted)
        }
        if size != CGSize.zero {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        } else {
            btn.sizeToFit()
        }
        self.init(customView: btn)
    }
}
