//
//  BaseViewModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

//为了抽取推荐和娱乐界面的基类，也需要抽取基类对应的ViewmModel
class BaseViewModel {
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadData(url:String, finished: @escaping () -> ()) {
        NetworkTools.requestData(type: .GET, url: url) { (result) in
            guard let resultDic = result as? [String : Any] else {return}
            guard let dicArray = result["data"] as? [[String : Any]] else {return}
            for dic in dicArray {
                self.anchorGroups.append(AnchorGroup(dic: dic))
            }
            finished()
        }
    }
}
