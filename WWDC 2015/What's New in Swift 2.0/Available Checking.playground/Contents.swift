//: Playground - noun: a place where people can play

import UIKit

//wwdc: What's new in Swift 2.0

//New API
@available (iOS 10.1, *)
func doSomething(){
    print("hello 10.1")
}

func changeName(){
    if #available(iOS 10.1, *){
        doSomething()
    }
}
changeName()
