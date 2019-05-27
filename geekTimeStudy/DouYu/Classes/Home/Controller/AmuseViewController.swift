//
//  AmuseViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class AmuseViewController: BaseViewController {
    fileprivate lazy var amuseVM =  AmuseViewModel()
}

extension AmuseViewController {
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}
