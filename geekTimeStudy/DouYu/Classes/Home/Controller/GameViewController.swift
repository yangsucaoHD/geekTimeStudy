//
//  GameViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

private let kMargin: CGFloat = 10
private let kItemWidth: CGFloat = (kScreenWidth - kMargin) / 3.0
private let kItemheight: CGFloat = kItemWidth * 5 / 6
private let kGameCellID: String = "kGameCellID"
private let kGameHeaderViewID: String = "kGameHeaderViewID"
private let kHeaderViewHeight: CGFloat = 50
private let kGameViewHeight:CGFloat = 90

class GameViewController: UIViewController {
    fileprivate lazy var gameViewModel: GameViewModel = {
       let gameVM = GameViewModel()
        return gameVM
    }()
    
    fileprivate lazy var gameView: RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewHeight , width: kScreenWidth, height: kGameViewHeight)
        return gameView
    }()
    
    fileprivate lazy var topHeaderView: HeaderView = {
       let topHeaderView = HeaderView.topHeaderView()
        topHeaderView.frame = CGRect(x: 0, y: -kGameViewHeight - kHeaderViewHeight, width: kScreenWidth, height: kHeaderViewHeight)
        topHeaderView.nameLabel.text = "常用"
        topHeaderView.moreBtn.isHidden = true
        return topHeaderView
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemWidth, height: kItemheight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: kHeaderViewHeight)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kGameHeaderViewID)
        collectionView.backgroundColor = UIColor .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

extension GameViewController {
    func setupUI() {
        self.view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.contentInset = UIEdgeInsets(top: kGameViewHeight + kHeaderViewHeight, left: 0, bottom: 0, right: 0)
        collectionView.addSubview(topHeaderView)
        collectionView.addSubview(gameView)
    }
}

extension GameViewController {
    func loadData() {
    gameViewModel.loadAllGames {
        self.collectionView.reloadData()
        let tempArray = self.gameViewModel.games[0..<10]
        self.gameView.group = Array(tempArray)
        }
    }
}


extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameViewModel.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kGameCellID", for: indexPath) as! GameCollectionViewCell
        let game = gameViewModel.games[indexPath.item]
        cell.item = game
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kGameHeaderViewID, for: indexPath) as! HeaderView
        header.nameLabel.text = "全部"
        header.imgView.image = UIImage(named: "pretty")
        header.moreBtn.isHidden = true
        return header
    }
}



