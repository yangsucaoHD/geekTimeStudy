//
//  HomeViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/16.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

// MARK: - 设置UI界面
extension HomeViewController {
    func setupUI() {
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        let size = CGSize(width: 44, height: 44)
        self.navigationController?.navigationBar.backgroundColor = UIColor.gray
//        //类方法
//        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarItem(imgName: "Image_launch_logo", highlightedImgName: "Image_launch_logo", size: CGSize.zero)
//        let historyItem = UIBarButtonItem.createBarItem(imgName: "agreementCheck", highlightedImgName: "agreementCheck", size: size)
//        let searchItem = UIBarButtonItem.createBarItem(imgName: "dy_navi_search", highlightedImgName: "dy_navi_search", size: size)
//        let sweepItem = UIBarButtonItem.createBarItem(imgName: "home_newSaoicon", highlightedImgName: "home_newSaoicon", size: size)
//        navigationItem.rightBarButtonItems = [historyItem, searchItem, sweepItem]
//
        //便利构造函数
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "Image_launch_logo")
        let historyItem = UIBarButtonItem(imgName: "agreementCheck", highlightedImgName: "agreementCheck", size: size)
        let searchItem = UIBarButtonItem(imgName: "dy_navi_search", highlightedImgName: "dy_navi_search", size: size)
        let sweepItem = UIBarButtonItem(imgName: "home_newSaoicon", highlightedImgName: "home_newSaoicon", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, sweepItem]
        
    }
}
