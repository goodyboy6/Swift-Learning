//: Playground - noun: a place where people can play

import UIKit

//WWDC: Building Better Apps with Value Types in Swift

/*
 CustomDebugStringConvertible
 CustomStringConvertible
 
 */

var anInt:UInt = 8
anInt = anInt.successor()
anInt = anInt.predecessor()
anInt = anInt.advancedBy(19, limit: 20)




//CustomDebugStringConvertible
struct Bus:CustomDebugStringConvertible {
    var name:String
    var produceDate:NSDate
    
    var debugDescription: String{
        return "Bus name is \(name) produced on \(produceDate))"
    }
}
let bus = Bus(name: "Temla", produceDate: NSDate())
print(bus)

//CustomStringConvertible
struct Car:CustomStringConvertible{
    var name:String
    var produceDate:NSDate
    
    var description: String{
        return "Car name is \(name) produced on \(produceDate))"
    }
}
let car = Car(name: "Temla", produceDate: NSDate())
print(car)


//NilLiteralConvertible
//if a obj is not Optional, it will now allow to be nil. so compiler error when : "var b:String = nil"
//1)contains value
var a:String? = "tttttttttttttttt"
print(a)
//==>compiler see this:
var opt:Optional<String> = Optional.init("tttttttttttttttt")
print(opt)



