//
//  RecommendBaseCollectionViewCell.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/23.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class RecommendBaseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImgView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var countBtn: UIButton!
    
    var anchor: AnchorModel? {
        didSet {
            guard let anchor = anchor else {return}
            
            var online = ""
            if anchor.online >= 10000 {
                online = "\(Int(anchor.online / 10000))万人在线"
            } else {
                online = "\(anchor.online)人在线"
            }
            
            countBtn.setTitle(online, for: .normal)
            tagLabel.text = anchor.nickname
            let iconURL = URL(string: anchor.vertical_src)
            coverImgView.kf.setImage(with: iconURL)
        }
    }
}
