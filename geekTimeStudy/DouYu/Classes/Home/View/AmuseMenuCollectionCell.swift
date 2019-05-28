//
//  AmuseMenuCollectionCell.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
private let kAmuseMenuCellID = "kAmuseMenuCellID"
private let kMenuItemMagin: CGFloat = 10
private let kMenuItemWidth: CGFloat = (kScreenWidth - 2 * kMenuItemMagin) / 4
private let kMenuItemHeight:CGFloat = (kMenuHeight - kMenuItemMagin) / 2

class AmuseMenuCollectionCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var group:[AnchorGroup]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kAmuseMenuCellID)
    }
    
    override func layoutSubviews() {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: kMenuItemWidth, height: kMenuItemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }
}

extension AmuseMenuCollectionCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAmuseMenuCellID, for: indexPath) as! GameCollectionViewCell
        let group = self.group?[indexPath.item]
        cell.item = group
        return cell
    }
    
}





