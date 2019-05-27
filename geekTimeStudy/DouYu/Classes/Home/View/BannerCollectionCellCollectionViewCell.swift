//
//  BannerCollectionCellCollectionViewCell.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/23.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class BannerCollectionCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bannerImgView: UIImageView!
    
    var banner: Banner? {
        didSet {
            let url = URL(string: banner?.pic_url ?? "")
            bannerImgView.kf.setImage(with: url)
            nameLabel.text = banner?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
