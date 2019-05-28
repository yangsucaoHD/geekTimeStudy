//
//  AmuseMenuView.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kAmuseMenuCollectionCell = "kAmuseMenuCollectionCell"
let kMenuHeight: CGFloat = 200

class AmuseMenuView: UIView {
    var group: [AnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
}

extension AmuseMenuView {
    override func awakeFromNib() {
        autoresizingMask = []
        collectionView.register(UINib(nibName: "AmuseMenuCollectionCell", bundle: nil), forCellWithReuseIdentifier: kAmuseMenuCollectionCell)
    }
    
    override func layoutSubviews() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: kScreenWidth, height: kMenuHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
    }
}

extension AmuseMenuView {
    class func amuseMenu() -> AmuseMenuView {
        return Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as! AmuseMenuView
    }
}

extension AmuseMenuView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if group == nil {return 0}
        let num = (group!.count - 1) / 8 + 1
        pageController.numberOfPages = num
        return num
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAmuseMenuCollectionCell, for: indexPath) as! AmuseMenuCollectionCell
        setupDataForCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    private func setupDataForCell(cell:AmuseMenuCollectionCell, indexPath: IndexPath) {
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        if endIndex > group!.count - 1 {
            endIndex = group!.count - 1
        }
        
        cell.group = Array(group![startIndex...endIndex])
    }
}

extension AmuseMenuView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetX = scrollView.contentOffset.x
        pageController.currentPage = Int(offSetX / self.bounds.width)
    }
}
