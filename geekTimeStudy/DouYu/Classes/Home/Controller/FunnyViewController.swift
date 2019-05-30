//
//  FunnyViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/28.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kTopHeight:CGFloat = 8

class FunnyViewController: BaseRecommendViewController {
    fileprivate lazy var funnyVM: FunnyViewModel = {
        let funnyVM = FunnyViewModel()
        return funnyVM
    }()
}

extension FunnyViewController {
    override func setupUI() {
        super.setupUI()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top:kTopHeight , left: 0, bottom: 0, right: 0)
    }
    
    override func loadData() {
        baseVM = funnyVM
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            self.loadDataFinished()
        }
        
    }
}
