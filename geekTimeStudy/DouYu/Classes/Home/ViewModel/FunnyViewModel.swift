//
//  FunnyViewModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/28.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {
    func loadFunnyData(finished: @escaping () -> ())  {
        loadData(url:"http://capi.douyucdn.cn/api/v1/getHotRoom/2", param: ["limit" : 30, "offset " : 0], finished: finished)//"http://capi.douyucdn.cn/api/v1/getColumnRoom/3"
    }
}



