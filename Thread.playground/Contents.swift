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


//DispatchQueue
//创建队列
let queue = DispatchQueue(label: "MyQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)

//同步执行
//queue.sync {
//    sleep(1)
//    print("in queue sync")
//}

//异步执行
//queue.async {
//    sleep(1)
//    print("in queue async")
//}

//异步的延时执行
//queue.asyncAfter(deadline: .now() + 2) {
//    print("asyncAfter")
//}

//print("after invoke queue method")

//DispatchGroup

let group = DispatchGroup()

group.enter()
queue.async {
    sleep(1)
    print("A 完成")
    group.leave()
}

group.enter()
queue.async {
    sleep(1)
    print("B 完成")
    group.leave()
}

print("group enter 完成")

//wait 阻塞流程
group.wait()

//notify 不阻塞流程
//group.notify(queue: queue) {
//    print("notify 完成")
//}

print("验证堵塞")

//Timer
var seconds = 10
let timer = DispatchSource.makeTimerSource(flags:[], queue: queue)
timer.schedule(deadline: .now(), repeating: 1.0)
timer.setEventHandler {
    seconds -= 1
    if seconds < 0 {
        timer.cancel()
    } else {
        print(seconds)
    }
}
timer.resume()
