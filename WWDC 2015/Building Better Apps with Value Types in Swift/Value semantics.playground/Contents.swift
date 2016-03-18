//: Playground - noun: a place where people can play

import UIKit

//WWDC: Building Better Apps with Value Types in Swift

//Reference semantics
//Imutability
//Value semantics
//Value types in pratice
//Mixing value types and refrence types

//
var array1 = [Int](arrayLiteral: 3,2,1);
var array2 = [Int](arrayLiteral: 1,2,3).sort(>)
if array1 == array2{
    print("array1 is equal to array2")
}

//How to implement Equatable Protocol:Outscope the Dog
struct Dog:Equatable {
    var name:String
}
func ==(lhs: Dog, rhs: Dog) -> Bool{
    return lhs.name == rhs.name
}
//text
if Dog(name: "boy") == Dog(name: "boy") {
    print("array1 is equal to array2")
}

//Uniquely Referenced Swidt Objects
struct MyWrapper {
    var id:Int
    var _object: AnyObject
    var objectFowWriting:AnyObject{
        mutating get{
            if !isUniquelyReferencedNonObjC(&_object){//Returns true iff object is a non-@objc class instance with a single strong reference.
                return _object.copy()
            }
            return _object;
        }
    
    }
}

var obj = NSObject()
var w1 = MyWrapper(id: 123, _object: obj)




