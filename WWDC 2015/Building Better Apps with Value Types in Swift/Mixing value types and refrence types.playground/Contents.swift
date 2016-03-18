//: Playground - noun: a place where people can play

import UIKit

//WWDC: Building Better Apps with Value Types in Swift

//Reference semantics
//Imutability
//Value semantics
//Value types in pratice
//Mixing value types and refrence types

var obj1 = NSObject()
var obj2 = NSObject()

var id1 = ObjectIdentifier(obj1)
var id2 = ObjectIdentifier(obj2)

print("id1:\(id1.uintValue) id2:\(id2.uintValue)")
if id1 == id2{
    print("is equal")
}

