//: Playground - noun: a place where people can play

import UIKit

//http://nshipster.com/swift-literal-convertible/

//Literal Convertible Protocols
/*
ArrayLiteralConvertible
BooleanLiteralConvertible
DictionaryLiteralConvertible
ExtendedGraphemeClusterLiteralConvertible
FloatLiteralConvertible
NilLiteralConvertible
IntegerLiteralConvertible
StringLiteralConvertible
StringInterpolationConvertible
UnicodeScalarLiteralConvertible
*/


//NilLiteralConvertible
//if a obj is not Optional, it will now allow to be nil. so compiler error when : "var b:String = nil"
//1)contains value
var a:String? = "tttttttttttttttt"
print(a)
//compiler see this:
var opt:Optional<String> = Optional.init("tttttttttttttttt")
print(opt)

//2)nil value
var b:String? = nil
print(b)
//compiler see this:
//var optb:Optional = Optional(nilLiteral: ())//NilLiteralConvertible Protocol
//print(optb)

//3)
print("\(a!)")//compiler will get value from Some(T)




protocol DogLiteralConvertible{
    typealias DogName//DogName: a promise to compiler
    init(dogLiteral:Self.DogName)
    static func dog(name n:DogName, age:Int) -> Self//Self: a promise to compiler
}

struct Dog:DogLiteralConvertible {
    var name:String
    init(dogLiteral:String){
        self.name = dogLiteral;
    }
    
    static func dog(name n: String, age: Int) -> Dog {
        let d = Dog(dogLiteral: n)
        return d
    }
}

var dd = Dog(dogLiteral: "HH")
var dd2 = Dog.init(dogLiteral: "HHHHHHHH")
dd.name
dd2.name


var tt:Dog = Dog.dog(name: "TT", age: 11)
tt.name





//extension Dog:StringLiteralConvertible{
//    init(unicodeScalarLiteral value: Self.UnicodeScalarLiteralType) {
//
//    }
//    
//}
