//
//  BaseViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/28.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var contentView:UIView?
    fileprivate lazy var animationImgView: UIImageView = {
        let animationImgView = UIImageView(image: UIImage(named: "img_loading_1"))
        animationImgView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named: "img_loading_2")!]
        animationImgView.animationDuration = 0.5
        animationImgView.animationRepeatCount = LONG_MAX
        animationImgView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return animationImgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension BaseViewController {
    func setupUI() {
        contentView?.isHidden = true
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        view.addSubview(animationImgView)
        animationImgView.center = view.center
        animationImgView.startAnimating()
    }
    
    func loadDataFinished() {
        contentView?.isHidden = false
        animationImgView.stopAnimating()
        animationImgView.isHidden = true
    }
}
