//
//  BaseViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit


private let kItemMargin: CGFloat = 10
private let kHeaderViewHeight: CGFloat = 50
private let kNormalCollectionViewCellID = "kNormalCollectionViewCellID"
let kNormalItemHeight: CGFloat = kNormalItemWidth * 3 / 4
let kPrettyItemHeight: CGFloat = kNormalItemWidth * 4 / 3
let kNormalItemWidth: CGFloat = (kScreenWidth - 3 * kItemMargin) / 2
let kPrettyCollectionViewCellID = "kPrettyCollectionViewCellID"
let kCollectionViewHeaderID = "kCollectionViewHeaderID"


class BaseRecommendViewController: BaseViewController {
    var baseVM:  BaseViewModel!
    
    lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNormalItemWidth, height: kNormalItemHeight)
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
        loadData()
    }
    
}


// MARK: - 设置UI界面
extension BaseRecommendViewController {
    override func setupUI() {
        contentView = collectionView
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        super.setupUI()
    }
}

extension BaseRecommendViewController {
    func loadData() {
        
    }
}


// MARK: -数据源实现
extension BaseRecommendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return baseVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseVM.anchorGroups[section].anchors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: RecommendBaseCollectionViewCell
        let anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.row]
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCollectionViewCellID, for: indexPath) as! NormalCollectionViewCell
        cell.anchor = anchor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headeriView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kCollectionViewHeaderID, for: indexPath) as! HeaderView
        headeriView.group = baseVM.anchorGroups[indexPath.section]
        return headeriView
    }
}

extension BaseRecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kNormalItemWidth, height: kNormalItemHeight)
    }
}


extension BaseRecommendViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let anchor = baseVM.anchorGroups[indexPath.section].anchors[indexPath.row]
        anchor.isVertical == 0 ? pushNormalRoom() : presentShowRoom()
    }
    
    private func presentShowRoom() {
        let showRoom = RoomShowViewController()
        present(showRoom, animated: true, completion: nil)
    }
    
    private func pushNormalRoom() {
        let normalRoom = RoomNormalViewController()
        navigationController?.pushViewController(normalRoom, animated: true)
    }
}

