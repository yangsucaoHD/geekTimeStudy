//
//  Person.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/17.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import Foundation

class Person: NSObject {
    private var name: String
    private var age: Int
    private var gender: Gender
    
    enum Gender {
        case male
        case female
    }
    init(name: String,age:Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func printSomething() -> Void {
        
    }
}


extension Person {
    
}

