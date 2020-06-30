import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//快捷方式创建Thread
//for i in 0..<10 {
//    Thread.detachNewThread {
//        print(i)
//    }
//}

//初始化器创建一个Thread,必须调用start开始
class ObjectTheard {
    
    func threadTest() {
        let thread = Thread(target: self, selector: #selector(threadWorker), object: nil)
        thread.start()
    }
    
    @objc func threadWorker() {
        print("threadWorker")
    }
}

//let obj = ObjectTheard()
//obj.threadTest()


//Operation
class ObjectOperation {
    func test() {
//        let operation = BlockOperation { [weak self] in
//            self?.threadWorker()
//        }
        let operation = MyOperation()
        operation.completionBlock = { () -> Void in
            print("completionBlock")
        }
        let queue = OperationQueue()
        queue.addOperation(operation)
    }
    
    @objc func threadWorker() {
        sleep(1)
        print("threadWorker")
    }
}

class MyOperation: Operation {
    override func main() {
        sleep(1)
        print("MyOperation main")
    }
}

//let obj = ObjectOperation()
//obj.test()
//print("after invoke test")


//Dispatch

let queue = DispatchQueue(label: "MyQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)

//queue.async {
//    sleep(1)
//    print("in queue sync")
//}

queue.asyncAfter(deadline: .now() + 1) {
    print("asyncAfter")
}

print("after invoke queue method")
