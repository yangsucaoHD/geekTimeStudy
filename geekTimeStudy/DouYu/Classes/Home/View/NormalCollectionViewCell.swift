//
//  NormalCollectionViewCell.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
import Kingfisher

class NormalCollectionViewCell: RecommendBaseCollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override var anchor: AnchorModel? {
        didSet {
            guard let anchor = anchor else {
                return
            }
            super.anchor = anchor
            nameLabel.text = anchor.room_name
            iconImage.image = UIImage(named: "vedio")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
