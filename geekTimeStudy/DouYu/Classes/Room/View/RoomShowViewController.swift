//
//  RoomShowViewController.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/28.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import UIKit

class RoomShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
    }
}

extension RoomShowViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
}
