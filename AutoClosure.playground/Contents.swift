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

func ?? <T> (optional: T?, defaultValue: @autoclosure () -> T) -> T {
    switch optional {
    case .some(let value):
        return value
    default:
        return defaultValue()
    }
}
