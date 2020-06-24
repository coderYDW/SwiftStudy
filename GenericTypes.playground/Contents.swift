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

var stack01 = Stack<String>()
stack01.push("a")
stack01.push("b")
stack01.push("c")
stack01.topItem
stack01.pop()
stack01.topItem
stack01.pop()
stack01.pop()
stack01.pop()


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



