//
//  AmuseViewModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel {
}

extension AmuseViewModel {
    func loadAmuseData(finished: @escaping () -> ()) {
        self.loadData(url: "http://capi.douyucdn.cn/api/v1/getHotRoom/2") {
            finished()
            print("娱乐数据获取完成")
        }
    }
}
