//
//  RecommendViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/21.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kBannerHeight:CGFloat = kScreenWidth * 3 / 8
private let kGameViewHeight:CGFloat = 90

class RecommendViewController: BaseViewController {
    
        fileprivate lazy var viewModel = RecommendViewModel()
    
        fileprivate lazy var banner: RecommendBannerView = {
            let banner = RecommendBannerView.recommendbanner()
            banner.frame = CGRect(x: 0, y: -kGameViewHeight-kBannerHeight, width: kScreenWidth, height: kBannerHeight)
            return banner
        }()
    
    fileprivate lazy var gameView: RecommendGameView = {
       let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewHeight, width: kScreenWidth, height: kGameViewHeight)
        return gameView
    }()
}


extension RecommendViewController {
    override func loadData() {
        baseVM = viewModel
        requestRecommendData()
    }
}

// MARK: - 设置UI界面
extension RecommendViewController {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(banner)
        collectionView.contentInset = UIEdgeInsets(top: kBannerHeight + kGameViewHeight, left: 0, bottom: 0, right: 0)
        
        collectionView.addSubview(gameView)
    }
}


// MARK: -数据源实现
extension RecommendViewController  {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: RecommendBaseCollectionViewCell
        let anchor = viewModel.anchorGroups[indexPath.section].anchors[indexPath.row]
        
        if indexPath.section == 1 {
           cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCollectionViewCellID, for: indexPath) as! PrettyCollectionViewCell
            cell.anchor = anchor
        } else {
            cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! RecommendBaseCollectionViewCell
        }
        return cell
    }
}

extension RecommendViewController {
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemWidth, height: kPrettyItemHeight)
        }
        
        return CGSize(width: kNormalItemWidth, height: kNormalItemHeight)
    }
}


// MARK: - 数据请求
extension RecommendViewController {
    func requestRecommendData() {
        viewModel.requestData {
            self.collectionView.reloadData()
            var group = self.viewModel.anchorGroups
            group.removeFirst()
            group.removeFirst()
            self.gameView.group = group
        }
        
        viewModel.getBannerData {
            self.banner.banners = self.viewModel.banners
        }
    }
}

