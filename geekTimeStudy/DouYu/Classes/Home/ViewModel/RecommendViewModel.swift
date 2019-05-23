//
//  RecommendViewModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class RecommendViewModel {
    
    lazy var anchorGroups: [AnchorGroup] = [AnchorGroup]()
    private lazy var bigData: AnchorGroup = AnchorGroup()
    private lazy var pretty: AnchorGroup = AnchorGroup()
    
    func requestData(finished: @escaping ()->()) {
//        NetworkTools.requestData(type: NetworkMethodType.GET, url: "https://httpbin.org/get", param: nil) { (result) in
//            print(result)
//            finished()
//        }
        
        let dgroup = DispatchGroup()
        
        dgroup.enter()
        //获取第一部分数据
        NetworkTools.requestData(type: .GET, url: "https://capi.douyucdn.cn/api/v1/getbigDataRoom") { (result) in
            //1.拿到字典
            guard let resultDic = result as? NSDictionary else {return}
            //2.根据data，获取数组
            guard let resultArray = resultDic["data"] as? [[String : NSObject]] else {return}
            //3.遍历数组获取字典，并将字典转换成模型对象
            self.bigData.tag_name = "热门"
            self.bigData.icon_url = ""
            for dic in resultArray {
                let anchor = AnchorModel(dic: dic)
                self.bigData.anchors.append(anchor)
            }
            dgroup.leave()
        }
        
        
        //获取第二部分数据
        dgroup.enter()
        NetworkTools.requestData(type: .GET, url: "https://capi.douyucdn.cn/api/v1/getVerticalRoom") { (result) in
            //1.拿到字典
            guard let resultDic = result as? NSDictionary else {return}
            //2.根据data，获取数组
            guard let resultArray = resultDic["data"] as? [[String : NSObject]] else {return}
            //3.遍历数组获取字典，并将字典转换成模型对象
            self.pretty.tag_name = "颜值"
            self.pretty.icon_url = "pretty"
            for dic in resultArray {
                let anchor = AnchorModel(dic: dic)
                self.pretty.anchors.append(anchor)
            }
            dgroup.leave()
        }
        
        //获取2-12的三部分数据
        dgroup.enter()
        NetworkTools.requestData(type: .GET, url: "https://capi.douyucdn.cn/api/v1/getHotCate", param: ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()]) { (result) in
//            print(result)
            //1.拿到字典
            guard let resultDic = result as? NSDictionary else {return}
            //2.根据data，获取数组
            guard let resultArray = resultDic["data"] as? [[String : NSObject]] else {return}
            //3.遍历数组获取字典，并将字典转换成模型对象
            for dic in resultArray {
                let group = AnchorGroup(dic: dic)
                self.anchorGroups.append(group)
            }
            
            for group in self.anchorGroups {
                print("----------")
                print(group.tag_name)
                for anchor in group.anchors {
                    print(anchor.nickname)
                }
            }
            dgroup.leave()
        }
        
        dgroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.append(self.pretty)
            self.anchorGroups.append(self.bigData)
            finished()
        }
        
    }
}
