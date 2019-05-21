//
//  SwiftLearning.swift
//  geekTimeStudy
//
//  Created by 郝丹 on 2019/5/15.
//  Copyright © 2019年 郝丹. All rights reserved.
//

import Foundation

class SwiftLearning: NSObject {
    public func test() -> Void {
        self.baseTest()
        self.arrayAndDic()
        self.switchTest()
        self.voidFunc()
        voidFunc()
        paramFunc(paramName: "paramFunc-paramName")
        print(returnFunc())
        let success = tupleTest()
        print("tupleTest result:\(success.code)➕\(success.message)")
        repeatFunc(2,task: {
            print("hello repeatFunc")
        })
        
        classTest()
        structTest()
        enumTest()
        
        optionalTest()
        
        xiamageSwiftLearning()
        
    }
    
    
    
    private func baseTest() -> Void {
        let name = "name"
        let hello = "hello"+" "+name
        //        name = "myName"//Cannot assign to value: 'name' is a 'let' constant
        print(hello)
        
        var className = "班级"
        className = "班级2"
        print(className)
        
        let Swift = "Hello Swift, Happy!!!"
        print("Swift内容:")
        for item in Swift {
            print(item)
        }
        
        for item in 1...5 {
            print("\(item)")
        }
        
        let a = 3,b = 5
        print("\(a)➕\(b)等于\(a+b)")
        
    }
    
    private func arrayAndDic() -> Void {
        var names = ["xiaoming","xiaohong","xiaoli"]
        print(names[0])
        print(names.count)
        names.append("xiaozhang")
        print(names.count)
        names[0] = "daming"
        print(names[0])
        
        var numberOfLegs = ["蜘蛛🕷":8,"蚂蚁🐜":6,"蛇🐍":0]
        numberOfLegs["蜗牛🐌"] = 0
        
        for (name,legs) in numberOfLegs {
            print("一只\(name)\(legs)支腿")
        }
        
        //        print(numberOfLegs["章鱼🐙"])//这个数据可能不存在
        print(numberOfLegs["章鱼🐙"] ?? 0)//Provide a default value to avoid this warning
        //        print(numberOfLegs["章鱼🐙"]!)//Force-unwrap the value to avoid this warning,强制解包的解决方案会导致闪退
        print(numberOfLegs["章鱼🐙"] as Any)//Explicitly cast to 'Any' with 'as Any' to silence this warning 打印了nil
        
        
        let possibleLegNumber: Int? = numberOfLegs["章鱼🐙"]
        if possibleLegNumber == nil {
            print("没有章鱼🐙的数据")
        } else {
            print("\(possibleLegNumber!)")//String interpolation produces a debug description for an optional value; did you mean to make this explicit?
        }
        
        //Swift对上面的代码简化写法
        if let possibleLegNumber = numberOfLegs["章鱼🐙"] {
            print("\(possibleLegNumber)")
        }
    }
    
    private func switchTest() -> Void {
        let legs = 2
        
        switch legs {
        case 0:
            print("爬")
        case 1,3,7,9:
            print("jump")
        case 2,4,6,8:
            print("walk")
        default:
            print("未知")
        }
    }
    
    private func voidFunc() {
        print("vidFunc")
    }
    
    private func paramFunc(paramName: String) {
        print("paramFunc \(paramName)")
    }
    
    private func returnFunc() -> String {
        return "returnFunc"
    }
    
    private func tupleTest() -> (code: Int,message: String) {
        return (200, "success")
    }
    
    private func closuretTest() {
        
        func greetingPrinter() -> () {
            print("hello world!!!")
        }
        
        let greetingPrinter: () -> () = {
            print("hello world!!!")
        }
    }
    
    private func repeatFunc(_ count: Int, task: ()->()) {
        for i in 0..<count {
            task()
        }
    }
    
    private func classTest() {
        let vehicle = Vehicle()
        print(vehicle.description)
        vehicle.numberOfWheels = 4
        print(vehicle.description)
        
        let bycircle = Bycircle()
        print(bycircle.description)
        
        let car = Car()
        print(car.description)
    }
    
    private func structTest() {
        let point = Point(x: 0.0,y: 0.0)
        let size = Size(width: 50, height: 50)
        let rectangle = Rect(position: point, size: size)
    }
    
    private func enumTest() {
        let day = Day.Monday
        let dayNum = Day.Monday.rawValue
        var direction = Direction.South
        print("\(direction)")
        direction = .East
        print("\(direction)")
        
        var trainStatus = TrainStatus()
        print(trainStatus.description)
        trainStatus = .Delayed(42)
        print(trainStatus.description)
    }
    
    private func templateTest() {
        var intStack = Stack<Int>()
        intStack.push(element: 50)
        let intLast = intStack.pop()
        
        var strStack = Stack<String>()
        strStack.push(element: "string")
        let strLast = strStack.pop()
    }
    
    private func findIndexOfString(str: String,arr: [String]) -> Int? {
        for (index,value) in arr.enumerated() {
            if value == str {
                return index
            }
        }
        return nil
    }
    
    private func optionalTest() {
        let celebrites = ["sanshang","motuo","anzhuo","jiya"]
        //optional binding
        if let index = findIndexOfString(str: "anzhuo", arr: celebrites) {
            print("\(index)")
        } else {
            print("no this member")
        }
    }
    
    func xiamageSwiftLearning() -> Void {
        let str1 = "hello world"
        let str2 = "fhdkfshf"
        let str3 = str1 + str2
        let len = str1.count
        
        let name = "haodan"
        let age = 18
        let height = 1.7
        
        let infoStr = "my name is \(name),age is \(age),height is \(height)!"
        
        let min = 3
        let second = 4
        let timeStr = String(format: "%02d:%02d", min,second)
        (timeStr as NSString).substring(to: 3)
        let range = NSRange(location: 0, length: 3)
        (timeStr as NSString).substring(with: range)
        
        let array1: Array<String> = ["",""]
        let array2: [String] = ["",""]
        
        var array = [String]()
        array.append("T##newElement: String##String")
        array.remove(at: 0)
        array[0] = ""
        
        for (index,item) in array.enumerated() {}
        let dic: [String:Any] = ["name":"haodan","age":18]
        var dic1 = [String : Any]()
        dic1["name"] = "haodan"
        dic1.removeValue(forKey: "name")
        
        let infoTuple = ("name", 18, 1.88)
        infoTuple.0
        let infoTuple1 = (name:"name", age:18, height:1.88)
        infoTuple1.name
        
        let (name1, age1, height1) = ("name", 18, 1.88)
        name1
        
        var myName: String? = nil
        myName = "haodan"
        print(myName!)
        
        if let myName1 = dic["name"] as? String {
             print(myName!)
        }
    }
}

enum MethodType {
    case get
    case post
    case put
    case delete
}



class Vehicle {
    //properties     stored property  与  computed property
    //methods
    //initializers
    
    var numberOfWheels = 0
    var description: String {
        get {
            return "\(numberOfWheels)个轮子"
        }
        //        set {
        //            //newValue  变量访问新值
        //        }
        
    }
    
}

class Bycircle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

// MARK: - 添加标记1 MARK
// FIXME: 添加标记2 FIXME
// TODO: 添加标记3 TODO

class Car: Vehicle {
    var speed = 0.0
    override init() {
        super.init()
        numberOfWheels = 4
    }
    override var description: String {
        return super.description + ",每小时\(speed)英里"
    }
}

class ParentsCar: Car {
    override var speed: Double {
        willSet {
            if newValue > 65.0 {
                print("请小心！！！")
            }
        }
        
        //        didSet {
        //
        //        }
    }
}


struct Point {
    var x,y: Double
    mutating func moveTotheRightBy(dx:Double) -> Void {
        x += dx;
    }
}

struct Size {
    var width,height: Double
}

struct Rect {
    var position:Point
    var size:Size
    var area: Double {
        return size.height*size.height
    }
    
    func isBiggerThaneRect(other: Rect) -> Bool {
        return self.area > other.area
    }
}

enum Day:Int {
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
}

enum Day2:Int {
    case Monday = 1,Tuesday,Wednesday
}

enum Direction {
    case North,South,East,West
}


enum TrainStatus {
    case OnTime
    case Delayed(Int)
    init() {
        self = .OnTime
    }
    
    var description:String {
        switch self {
        case .OnTime:
            return "准时到达"
        case .Delayed(let minutes):
            return "延误\(minutes)分钟"
            //        default:
            //            return "状态未知"
        }
    }
    
}

//类型嵌套 Nested Types
class Train {
    enum TrainStatus {
        case OnTime
        case Delayed(Int)
        init() {
            self = .OnTime
        }
        
        var description:String {
            switch self {
            case .OnTime:
                return "准时到达"
            case .Delayed(let minutes):
                return "延误\(minutes)分钟"
                //        default:
                //            return "状态未知"
            }
        }
    }
    
    var status = TrainStatus()
}

//Extension   通OC的catagory      对类、结构体都可以进行扩展，系统的，自定义的o都可以
extension Size {
    mutating func increasebByFactor(factor: Int) {
        width *= Double(factor)
        height *= Double(factor)
    }
}



//A Non-Generic Stack Structure  一个非泛型结构化额结构体
struct IntStack {
    var elements = [Int]()
    
    mutating func push(element:Int)  {
        elements.append(element)
    }
    
    mutating func pop() -> Int {
        return elements.removeLast()
    }
}

//泛型
struct Stack<T> {
    var elements = [T]()
    
    mutating func push(element:T)  {
        elements.append(element)
    }
    
    mutating func pop() -> T {
        return elements.removeLast()
    }
}

class ACar {
    var wheels: Int
    func fillGasTrank() {}
    init(wheels: Int) {
        self.wheels = wheels
        fillGasTrank()
    }
}

class RaceCar: ACar {
    var hasTurbo: Bool
    override func fillGasTrank() {}
    init(wheels: Int,hasTurbo: Bool) {
        self.hasTurbo = hasTurbo
        super.init(wheels: wheels)
    }
    convenience init(hasTurbo: Bool) {
        self.init(wheels: 4, hasTurbo: hasTurbo)
    }
    convenience init() {
        self.init(wheels: 4, hasTurbo: true)
    }
    //    init(hasTurbo:Bool) {
    //        self.hasTurbo = hasTurbo
    //        super.init(wheels: 4)
    //    }
}

class FormulaOne: RaceCar {
    let minimumweight = 43
    //    init(hasTurbo: Bool) {
    //        super.init(wheels: 4, hasTurbo: hasTurbo)
    //    }
}






