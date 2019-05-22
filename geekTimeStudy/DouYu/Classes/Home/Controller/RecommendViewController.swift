//
//  RecommendViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/21.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kItemMargin: CGFloat = 10
private let kItemWidth: CGFloat = (kScreenWidth - 3 * kItemMargin) / 2
private let kNormalItemHeight: CGFloat = kItemWidth * 3 / 4
private let kPrettyItemHeight: CGFloat = kItemWidth * 4 / 3
private let kNormalCollectionViewCellID = "kNormalCollectionViewCellID"
private let kPrettyCollectionViewCellID = "kPrettyCollectionViewCellID"
private let kCollectionViewHeaderID = "kCollectionViewHeaderID"
private let kHeaderViewHeight: CGFloat = 50

class RecommendViewController: UIViewController {

        fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemWidth, height: kNormalItemHeight)
        layout.minimumInteritemSpacing = kItemMargin
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: kHeaderViewHeight)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "NormalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kNormalCollectionViewCellID)
        collectionView.register(UINib(nibName: "PrettyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCollectionViewCellID)
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCollectionViewHeaderID)
        return collectionView;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

// MARK: - 设置UI界面
extension RecommendViewController {
    func setupUI() {
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}


// MARK: -数据源实现
extension RecommendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell
        
        if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCollectionViewCellID, for: indexPath)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCollectionViewCellID, for: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headeriView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCollectionViewHeaderID, for: indexPath)
        return headeriView
    }
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kItemWidth, height: kPrettyItemHeight)
        }
        
        return CGSize(width: kItemWidth, height: kNormalItemHeight)
    }
}
