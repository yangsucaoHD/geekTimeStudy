//
//  HomeViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/16.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

let kTitleViewHeight: CGFloat = 40

class HomeViewController: UIViewController {

    lazy fileprivate var titleView: PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kNavigationBarHeight + kStatusBarHeight, width: kScreenWidth, height: kTitleViewHeight)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var contentPageView: PageContentView = {[weak self] in
        let pageY = kStatusBarHeight + kNavigationBarHeight + kTitleViewHeight
        let pageHeight = kScreenHeight - pageY
        let pageFrame = CGRect(x: 0, y: pageY, width: kScreenWidth, height: pageHeight)
        
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let page = PageContentView(frame: pageFrame, childVcs: childVcs, parentVc: self)
        page.delegate = self
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

// MARK: - 设置UI界面
extension HomeViewController {
    func setupUI() {
        //1.设置导航栏
        setNavigationBar()
        //2.添加titleView
        view.addSubview(titleView)
        //添加pageContentView
        view.addSubview(contentPageView)
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

extension HomeViewController: PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex: Int) {
        contentPageView.setCurrentIndex(index: selectedIndex)
    }
}

extension HomeViewController: PageContentViewDelegate {
    func pageContentView(pageContentView: PageContentView, process: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setTitleWithProcess(process: process, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
