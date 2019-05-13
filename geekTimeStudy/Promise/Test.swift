//
//  Test.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/13.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import Foundation
import PromiseKit

class Test: NSObject {
    func show() -> Void {
        print("hello swift")
    }
    
    func testPromiseKit() -> Void {
        _ = cook()
            .then { data -> Promise<String> in
                return self.eat(data: data)
            }.then { data -> Promise<String> in
                return self.wash(data: data)
            }.done { data in
                print(data)
        }
        
//        _ = cook()
//            .then(eat)
//            .then(wash)
//            .done { data in
//                print(data)
//        }
    }
    
    //做饭
    func cook() -> Promise<String> {
        print("开始做饭。")
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("做饭完毕！")
                resolver.fulfill("鸡蛋炒饭")
            }
        }
        return p
    }
    
    //吃饭
    func eat(data:String) -> Promise<String> {
        print("开始吃饭：" + data)
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("吃饭完毕！")
                resolver.fulfill("一块碗和一双筷子")
            }
        }
        return p
    }
    
    //洗碗
    func wash(data:String) -> Promise<String> {
        print("开始洗碗：" + data)
        let p = Promise<String> { resolver in
            //做一些异步操作(延迟1秒执行)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                print("洗碗完毕！")
                resolver.fulfill("干净的碗筷")
            }
        }
        return p
    }
    
    
    
//    _ = cook()
//    .then(eat)
//    .then(wash)
//    .done { data in
//    print(data)
//    }
}



