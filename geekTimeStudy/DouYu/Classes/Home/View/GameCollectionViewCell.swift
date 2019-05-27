//
//  GameCollectionViewCell.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var item: GameBaseModel? {
        didSet {
            let url = URL(string: item?.icon_url ?? "")
            imgView.kf.setImage(with: url)
            
            nameLabel.text = item?.tag_name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
