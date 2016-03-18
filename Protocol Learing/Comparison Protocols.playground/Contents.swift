//: Playground - noun: a place where people can play

import UIKit

//WWDC: Building Better Apps with Value Types in Swift

//Comparable Protocol
struct Dog{
    var name:String
    var age:Int
};


extension Dog:Comparable{}
func <(lhs:Dog, rhs:Dog) -> Bool{
    return lhs.age < rhs.age
}
func ==(lhs:Dog, rhs:Dog) -> Bool{
    return lhs.name == rhs.name && lhs.age == rhs.age
}

//test Comparable Protocol
var oldDog = Dog(name: "Jess", age: 12)
var youngDog = Dog(name: "Telli", age: 5)

oldDog > youngDog
oldDog >= youngDog

extension Dog:Hashable{//can be as key of Dictionary
    var hashValue:Int{
        get{
            return self.age.hashValue ^ self.name.hashValue
        }
    }
}
var tempDic = Dictionary<Dog, Int>()
tempDic[Dog(name: "Tina", age: 15)] = 12
tempDic



