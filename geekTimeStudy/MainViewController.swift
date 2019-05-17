//
//  MainViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/16.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVc(name: "Home")
        addChildVc(name: "Live")
        addChildVc(name: "Follow")
        addChildVc(name: "Profile")
    }
    
    func addChildVc(name:String) -> Void {
        let childVc = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(childVc)
    }
}
