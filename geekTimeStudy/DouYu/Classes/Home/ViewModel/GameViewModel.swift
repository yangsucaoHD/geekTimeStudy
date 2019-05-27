//
//  GameViewModel.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/27.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var games: [Game] = [Game]()
}

extension GameViewModel {
    func loadAllGames(finished: @escaping ()->()) {
        NetworkTools.requestData(type: .GET, url: "http://capi.douyucdn.cn/api/v1/getColumnDetail") { (result) in
            guard let resultDic = result as? [String: Any] else {return}
            guard let dataArray = resultDic["data"] as? [[String : Any]] else {return}
            for dic in dataArray {
                let game = Game(dic: dic)
                self.games.append(game)
            }
         finished()
        }
    }
}
