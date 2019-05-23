//
//  PrettyCollectionViewCell.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
import Kingfisher

class PrettyCollectionViewCell: RecommendBaseCollectionViewCell {

    @IBOutlet weak var locationBtn: UIButton!

    override var anchor: AnchorModel? {
        didSet {
            guard let anchor = anchor else {return}
            super.anchor = anchor
            locationBtn.setTitle(anchor.room_name, for: .normal)//anchor_city
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
