//
//  UIColor+Extension.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/20.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}

