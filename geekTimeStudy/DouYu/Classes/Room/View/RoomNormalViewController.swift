//
//  RoomNormalViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/28.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class RoomNormalViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)//会丢失边缘滑动手势
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        
//        navigationController?.navigationBar.isHidden = true//不会丢失边缘滑动手势,但是返回导航栏会突然出现很丑
//        self.tabBarController?.tabBar.isHidden = true//如果不在自定义基类里面写隐藏，需要在每个打开页面隐藏，离开显示
//        self.hidesBottomBarWhenPushed = true  //设置在这里没用，已经迟了
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
