//
//  Banner.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/23.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class Banner: NSObject {
    var title: String = ""
    var pic_url: String = ""
    var tv_pic_url: String = ""
    var room : [String : NSObject]? {
        didSet {
            guard let room = room else {return}
            anchor = AnchorModel(dic: room)
        }
    }
    var anchor: AnchorModel?
    
//    oa_source
//    source
//    main_id
//    id
    
    init(dic: [String : NSObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
