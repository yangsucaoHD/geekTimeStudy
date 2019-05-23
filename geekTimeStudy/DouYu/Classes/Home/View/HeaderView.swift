//
//  HeaderView.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/22.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    var group: AnchorGroup? {
        didSet {
            nameLabel.text = group?.tag_name
            imgView.image = UIImage(named: "pretty")//UIImage(named: group?.icon_url ?? "pretty")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
