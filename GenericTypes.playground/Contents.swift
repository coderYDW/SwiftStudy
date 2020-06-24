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
protocol Container {
    //协议中定义泛型的方法(关联类型),可以进行类型约束
    associatedtype ItemType: Hashable
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

//在关联类型约束里面使用协议,协议可以作为它自身的要求出现
protocol suffixableContainer: Container {
    associatedtype suffix: suffixableContainer where suffix.ItemType == ItemType
    //返回Container中的前面的指定size的Container,相当于截取子Container
    func suffix(_ size: Int) -> suffix
}

//遵循关联类型的协议,必须实现必要的方法,其他方法可以选择实现
struct Stack01<Element: Hashable>: Container {
    
    //可以省略typealias,Swift会自动推断
    //typealias ItemType = Element
    
    private var items = [Element]()
    
    var count: Int {
        return items.count
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    mutating func append(_ item: Element) {
        items.append(item)
    }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        //return isEmpty ? nil : items.removeLast()
        return items.popLast()
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
    
//    func suffix(_ size: Int) -> Stack01 {
//        return self.
//    }
    
}

//var stack01 = Stack01<String>()
//stack01.append("a")
//stack01.append("b")
//stack01.count
//stack01[1]





