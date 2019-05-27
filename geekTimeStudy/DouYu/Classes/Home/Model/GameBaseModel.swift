//
//  GameBaseModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class GameBaseModel: NSObject {
    var tag_name: String?
    var icon_url: String?
    
    init(dic: [String : Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override init() {
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
