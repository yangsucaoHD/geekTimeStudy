//
//  RecommendBannerView.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/23.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kBannnerCollectionCellID = "kBannnerCollectionCellID"

class RecommendBannerView: UIView {
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var timer: Timer?
    var banners: [Banner]? {
        didSet {
            collectionView.reloadData()
            pageController.numberOfPages = banners?.count ?? 0
            
            let indexPath = NSIndexPath(item: (banners?.count ?? 0) * 10, section: 0)
            collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
            removeTimer()
            addTimer()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = []
        
        collectionView.register(UINib(nibName: "BannerCollectionCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kBannnerCollectionCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
}


extension RecommendBannerView {
    class func recommendbanner() -> RecommendBannerView {
        return Bundle.main.loadNibNamed("RecommendBannerView", owner: nil, options: nil)?.first as! RecommendBannerView
    }
}

//这种加载的方法可以抽取出来
//Bundle.main.loadNibNamed("TGEmoticonInputV", owner: nil, options: nil)?.first as! TGEmoticonInputV
//let nib = UINib(nibName: "TGEmoticonInputV", bundle: nil)
//let v = nib.instantiate(withOwner: nil, options: nil)[0] as! TGEmoticonInputV

extension RecommendBannerView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (banners?.count ?? 0) * 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kBannnerCollectionCellID", for: indexPath) as! BannerCollectionCellCollectionViewCell
        let banner = banners![indexPath.item % banners!.count]
        cell.banner = banner
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
}

extension RecommendBannerView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetX = scrollView.contentOffset.x + collectionView.bounds.width * 0.5
        pageController.currentPage = Int(offSetX / collectionView.bounds.width) % (banners?.count ?? 1)
    }
}



extension RecommendBannerView {
    fileprivate func addTimer() {
        timer = Timer(timeInterval: 3, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
    }
    
    fileprivate func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func scrollToNext() {
        let offsetX = collectionView.contentOffset.x + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}
