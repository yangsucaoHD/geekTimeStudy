//
//  HomeViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/16.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit
import Flutter

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
        let pageHeight = kScreenHeight - pageY - kTabBarHeight
        let pageFrame = CGRect(x: 0, y: pageY, width: kScreenWidth, height: pageHeight)
        
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunnyViewController())
        
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
        let historyItem = UIBarButtonItem(title: "flutter", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleButtonAction))
//            UIBarButtonItem(imgName: "agreementCheck", highlightedImgName: "agreementCheck", size: size, target: self, action: #selector(handleButtonAction))
        
        let searchItem = UIBarButtonItem(imgName: "dy_navi_search", highlightedImgName: "dy_navi_search", size: size)
        let sweepItem = UIBarButtonItem(imgName: "home_newSaoicon", highlightedImgName: "home_newSaoicon", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, sweepItem]
    }
    
    // MARK: - flutter 页面混编页面跳转
    @objc func handleButtonAction() {
        let flutterViewController = FlutterViewController()
        self.present(flutterViewController, animated: false, completion: nil)
    }
    
    private func receiveBatteryLevel(result: FlutterResult) {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDeviceBatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery info unavailable",
                                details: nil))
        } else {
            result(Int(device.batteryLevel * 100))
        }
    }
}


// MARK: - 实现PageTitleViewDelegate代理
extension HomeViewController: PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex: Int) {
        contentPageView.setCurrentIndex(index: selectedIndex)
    }
}

// MARK: - 实现PageContentViewDelegate代理
extension HomeViewController: PageContentViewDelegate {
    func pageContentView(pageContentView: PageContentView, process: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setTitleWithProcess(process: process, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}


