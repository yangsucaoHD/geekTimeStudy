//
//  AmuseViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
private let kAmuseMenuHeight: CGFloat = 200

class AmuseViewController: BaseViewController {
    fileprivate lazy var amuseVM =  AmuseViewModel()
    fileprivate lazy var amuseMenu: AmuseMenuView = {
        let menu = AmuseMenuView.amuseMenu()
        menu.frame = CGRect(x: 0, y: -kAmuseMenuHeight, width: kScreenWidth, height: kAmuseMenuHeight)
        return menu
    }()
}


extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(amuseMenu)
        collectionView.contentInset = UIEdgeInsets(top: kAmuseMenuHeight, left: 0, bottom: 0, right: 0)
    }
}


extension AmuseViewController {
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            self.amuseMenu.group = self.amuseVM.anchorGroups
            self.amuseMenu.group?.removeFirst()
            self.collectionView.reloadData()
        }
    }
}
