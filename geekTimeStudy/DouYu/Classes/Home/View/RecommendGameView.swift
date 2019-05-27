//
//  RecommendGameView.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/24.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
private let kGameCollectionCell = "kGameCollectionCell"

class RecommendGameView: UIView {
    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    var group: [GameBaseModel]? {
        didSet {
            gameCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        autoresizingMask = []
        gameCollectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kGameCollectionCell)
    }
    
    override func layoutSubviews() {
        let layout = gameCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let width = (kScreenWidth - 20.0) / 5.0
        layout.itemSize = CGSize(width: 90, height: 80)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        gameCollectionView.isScrollEnabled = true
        gameCollectionView.showsHorizontalScrollIndicator = false
    }
    
}

extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView{
        let recommendGameView = Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)?.first as! RecommendGameView
        return recommendGameView
    }
}


extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCollectionCell, for: indexPath) as! GameCollectionViewCell
        let item = group![indexPath.item]
        cell.item = item
        return cell
    }
    
    
}




