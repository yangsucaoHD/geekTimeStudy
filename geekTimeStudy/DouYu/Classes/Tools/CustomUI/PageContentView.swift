//
//  PageContentView.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/20.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

protocol PageContentViewDelegate: class {
    func pageContentView(pageContentView:PageContentView, process:CGFloat, sourceIndex: Int,targetIndex: Int)
}

private let ContentID = "ContentID"

class PageContentView: UIView {
    // MARK: - 自定义属性
    fileprivate var childVcs: [UIViewController]
    fileprivate weak var parentVc: UIViewController?
    fileprivate var startOffsetX: CGFloat = 0
    fileprivate var isForbiddenScroll = false
    weak var delegate: PageContentViewDelegate?
    
    // MARK: - 懒加载属性
    fileprivate lazy var collectionView: UICollectionView = {[weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
    
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentID)
        return collectionView
    }()
    
    // MARK: - 自定义构造函数
    init(frame: CGRect,childVcs: [UIViewController],parentVc: UIViewController?) {
        self.childVcs = childVcs
        self.parentVc = parentVc
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - 设置UI界面
extension PageContentView {
    fileprivate func setupUI() {
        //1.将所有子控制器添加到父控制器中
        for child in childVcs {
            parentVc?.addChildViewController(child)
        }
        //2.添加UICollectionView，用于在cell中存放控制器view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}


extension PageContentView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentID, for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        return cell
    }
    
}

extension PageContentView {
    func setCurrentIndex(index:Int) {
        isForbiddenScroll = true
        let offsetX = CGFloat(index) * collectionView.frame.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

extension PageContentView : UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isForbiddenScroll = false
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isForbiddenScroll {return}
        var process: CGFloat = 0
        var sourceIndex: Int = 0
        var targetIndex: Int = 0
        
        print(process)
        
        let currentOffsetX = scrollView.contentOffset.x
        let base = currentOffsetX / scrollView.frame.width
        if currentOffsetX > startOffsetX {//左滑
            process = base - floor(base)
            sourceIndex = Int(base)
            targetIndex = sourceIndex + 1
            if targetIndex >= childVcs.count {
                targetIndex = childVcs.count - 1
            }
            if currentOffsetX - startOffsetX == scrollView.frame.width {
                process = 1
                targetIndex = sourceIndex
                sourceIndex = targetIndex - 1
            }
        } else {
            process = 1 - (base - floor(base))
            targetIndex = Int(base)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childVcs.count {
                sourceIndex = childVcs.count - 1
            }
        }
        print("progress= \(process),sourceIndex= \(sourceIndex),targetIndex = \(targetIndex)")
        delegate?.pageContentView(pageContentView: self, process: process, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    
}

