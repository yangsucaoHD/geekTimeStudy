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
    fileprivate lazy var bigData: AnchorGroup = AnchorGroup()
    fileprivate lazy var pretty: AnchorGroup = AnchorGroup()
    
    lazy var banners : [Banner] = [Banner]()
}


// MARK: - get recommed data
extension RecommendViewModel {
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
            print("获取热门的数据")
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
            print("获取颜值的数据")
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
//                print("----------")
//                print(group.tag_name)
                for anchor in group.anchors {
//                    print(anchor.nickname)
                }
            }
            print("获取其他数据")
            dgroup.leave()
        }
        
        dgroup.notify(queue: DispatchQueue.main) {
            self.anchorGroups.insert(self.pretty, at: 0)
            self.anchorGroups.insert(self.bigData, at: 0)
            finished()
        }
        
    }
}


extension RecommendViewModel {
    func getBannerData(finished: @escaping () -> ()){
        NetworkTools.requestData(type: .GET, url: "http://www.douyutv.com/api/v1/slide/6") { (result) in
            guard let resultDic = result as? NSDictionary else {return}
            
            guard let resultArray = resultDic["data"] as? [[String : NSObject]] else {return}
            
            for dic in resultArray {
                let banner = Banner(dic: dic)
                self.banners.append(banner)
            }
            finished()
        }
    }
}
