//
//  AnchorModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    var room_id: Int = 0
    var vertical_src: String = "default"
    var isVertical: Int = 0
    var room_name: String = ""
    var nickname: String = ""
    var online: Int = 0
    var anchor_city: String = ""
    
    
    init(dic: [String : Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
