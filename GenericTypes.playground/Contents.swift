import UIKit

var str = "Hello, playground"

//泛型

//泛型函数
func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}
//var a = 3
//var b = 8
//swap(&a, &b)
//print(a, b)


//泛型类型
struct Stack<Element> {
    private var items = [Element]()
    var isEmpty: Bool {
        return items.isEmpty
    }
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        //return isEmpty ? nil : items.removeLast()
        return items.popLast()
    }
}

//扩展不需要写类型形式参数列表,原始函数定义的类型形式参数列表在扩展体里面仍然有效,可以用于扩展体形式参数类型
extension Stack {
    var topItem: Element? {
        return items.last
    }
}

//var stack01 = Stack<String>()
//stack01.push("a")
//stack01.push("b")
//stack01.push("c")
//stack01.topItem
//stack01.pop()
//stack01.topItem
//stack01.pop()
//stack01.pop()
//stack01.pop()


struct Queue<Element> {
    private var items = [Element]()
    var isEmpty: Bool {
        return items.isEmpty
    }
    mutating func endqueue(_ item: Element) {
        items.append(item)
    }
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : items.removeFirst()
    }
}

//var queue01 = Queue<String>()
//queue01.endqueue("a")
//queue01.endqueue("b")
//queue01.endqueue("c")
//queue01.endqueue("d")
//queue01.dequeue()
//queue01.dequeue()
//queue01.dequeue()
//queue01.dequeue()
//queue01.dequeue()


//泛型的类型约束

//T必须遵循Equatable才能进行比较操作
func firstIndex<T: Comparable>(of valueToFind: T, _ array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if valueToFind == value {
            return index
        }
    }
    return nil
}

let arr = ["a", "b", "c", "v", "b", "e"]
firstIndex(of: "e", arr)

//T必须是指定的类或者子类
class SomeClass {
    var someString: String = ""
    func someFunc() {
        print("someFunc")
    }
}

class SomeSubClass: SomeClass {
    var subString: String = ""
    override func someFunc() {
        print("someSubFunc")
    }
}

func someMethed<T: SomeClass>(someOne: T) {
    someOne.someFunc()
}

//let someOne = SomeClass()
//someMethed(someOne: someOne)
//
//let someTwo = SomeSubClass()
//someMethed(someOne: someTwo)


//协议:关联类型
//protocol Container {
//    //协议中定义泛型的方法(关联类型),可以进行类型约束
//    associatedtype ItemType: Hashable
//    mutating func append(_ item: ItemType)
//    var count: Int { get }
//    subscript(i: Int) -> ItemType { get }
//}
//
////在关联类型约束里面使用协议,协议可以作为它自身的要求出现
//protocol suffixableContainer: Container {
//    associatedtype suffix: suffixableContainer where suffix.ItemType == ItemType
//    //返回Container中的前面的指定size的Container,相当于截取子Container
//    func suffixFunc(_ size: Int) -> suffix
//}
//
////遵循关联类型的协议,必须实现必要的方法,其他方法可以选择实现
//struct Stack01<Element: Hashable>: suffixableContainer {
//
//    //可以省略typealias,Swift会自动推断
//    //typealias ItemType = Element
//
//    private var items = [Element]()
//
//    //必须实现
//    var count: Int {
//        return items.count
//    }
//
//    mutating func append(_ item: Element) {
//        items.append(item)
//    }
//
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//
//    //这里省略会报错
//    typealias suffix = Stack01<Element>
//
//    func suffixFunc(_ size: Int) -> suffix {
//        var stack = Stack01<Element>()
//        for (index, item) in items.enumerated() {
//            if index < size {
//                stack.append(item)
//            }
//        }
//        return stack
//    }
//
//
//    //选择实现
//    var isEmpty: Bool {
//        return items.isEmpty
//    }
//
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//
//    mutating func pop() -> Element? {
//        //return isEmpty ? nil : items.removeLast()
//        return items.popLast()
//    }
//
//}

protocol Container {
    //协议中定义泛型的方法(关联类型),可以进行类型约束
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

//在关联类型约束里面使用协议,协议可以作为它自身的要求出现
protocol suffixableContainer: Container {
    associatedtype suffix: suffixableContainer where suffix.ItemType == ItemType
    //返回Container中的前面的指定size的Container,相当于截取子Container
    func suffixFunc(_ size: Int) -> suffix
}

//遵循关联类型的协议,必须实现必要的方法,其他方法可以选择实现
struct Stack01<Element>: suffixableContainer {
    
    //可以省略typealias,Swift会自动推断
    //typealias ItemType = Element
    
    private var items = [Element]()
    
    //必须实现
    var count: Int {
        return items.count
    }
    
    mutating func append(_ item: Element) {
        items.append(item)
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
    
    //这里省略会报错
    typealias suffix = Stack01<Element>
    
    func suffixFunc(_ size: Int) -> suffix {
        var stack = Stack01<Element>()
        for (index, item) in items.enumerated() {
            if index < size {
                stack.append(item)
            }
        }
        return stack
    }
    
    
    //选择实现
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        //return isEmpty ? nil : items.removeLast()
        return items.popLast()
    }
    
}


var stack01 = Stack01<String>()
stack01.append("a")
stack01.append("b")
stack01.count
stack01[1]
var stack02 = stack01.suffixFunc(1)
stack02.append("c")

//为泛型定义要求
func isEqualBetween<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        return true
        
}

isEqualBetween(stack01, stack02)

//泛型下标
extension Container {
    //定义泛型下标,使用where约束泛型类型
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType]
        where Indices.Iterator.Element == Int {
            var result = [ItemType]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
