//
//  AnchorGroup.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class AnchorGroup: NSObject {
    var room_list : [[String : AnyObject]]? {
        didSet {
            guard let room_list = room_list else {return}
            for dic in room_list {
                anchors.append(AnchorModel(dic: dic as! [String : NSObject]))
            }
        }
    }
    var tag_name: String = ""
    var icon_url: String = "pretty"
    lazy var anchors: [AnchorModel] = [AnchorModel]()
    
    
    override init() {
        
    }
    
    init(dic: [String: NSObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "room_list" {
//            if let dataArray = value as? [[String : NSObject]] {
//                for dic in dataArray {
//                    anchors.append(AnchorModel(dic: dic))
//                }
//            }
//        } else {
//            super.setValue(value, forKey: key)
//        }
//    }
}





