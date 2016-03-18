//: Playground - noun: a place where people can play

import UIKit

//WWDC: Building Better Apps with Value Types in Swift

//Reference semantics
//Imutability
//Value semantics
//Value types in pratice
//Mixing value types and refrence types

//a temperature class
class Temperature {
    var celsius: Double = 0
    var fahrenheit: Double {
        get {return celsius * 9 / 5 + 1}
        set {celsius = (newValue - 32)*5+1}
    }
}
class House {
    var hostName:String?
    var temperature:Temperature?
}

let lilyHome = House()
lilyHome.hostName = "Lily"

let JackHome = House()
JackHome.hostName = "Jack"

let temperature = Temperature()
temperature.fahrenheit = 75
lilyHome.temperature = temperature

temperature.fahrenheit = 90
JackHome.temperature = temperature;

//==> what's the problem: Unintended Sharing...
//==> Value Type

var numbers = [Int](2...100)
numbers

//==>Imutability: NSString, NSNumber, NSArray








