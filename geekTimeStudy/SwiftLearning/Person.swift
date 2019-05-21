//
//  Person.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/17.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import Foundation

class Person: NSObject {
    private var name: String?
    private var age: Int = 0
    private var gender: Gender = .male
    
    
    enum Gender {
        case male
        case female
    }
    
    init(name: String,age:Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    init(dic:[String : Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

    
    func printSomething() -> Void {
        
    }
}


extension Person {
    
}

func test() {
    loadData { (jsonData : String) in
        
    }
}


func loadData(finishedBlock : @escaping (_ jsonData : String)->()) {
    DispatchQueue.global().async {
        DispatchQueue.main.sync {
            finishedBlock("data")
        }
    }
}
