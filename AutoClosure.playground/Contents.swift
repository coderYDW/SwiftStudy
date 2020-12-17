import UIKit

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("true")
    }
}
//没有@autoclosure
//logIfTrue { 2 > 1 }

//有@autoclosure
logIfTrue(2 > 1)
