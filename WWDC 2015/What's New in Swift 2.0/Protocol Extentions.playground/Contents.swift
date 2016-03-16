//: Playground - noun: a place where people can play

import UIKit

//wwdc: What's new in Swift 2.0

//2)Extensions vs. Global Functions

//swift 1.0
//typealias ArrayType = protocol<CollectionType, SequenceType>
//func countIf<T:ArrayType>(match: (T.Generator.Element)->Bool)->Int{
//    var n = 0
//    for value in T {
//        if match(value) {
//            n++
//        }
//    }
//    return n
//}

extension Array{
    func countIf(match: (Element)->Bool) ->Int{//(Element)->Bool ==> Element->Bool
        var n = 0
        for value in self{
            if match(value) {
                n++
            }
        }
        return n
    }
}
let animals = Array(arrayLiteral: "Dog", "Cat", "Dragon", "Tiger")
let animalsCount = animals.countIf { (ani) -> Bool in
    return ani.characters.count > 3
}
animalsCount

//==> protocol-oriented
extension CollectionType{
    func countIf(match: (Self.Generator.Element)->Bool) ->Int{//(Element)->Bool ==> Element->Bool
        var n = 0
        for value in self{
            if match(value) {
                n++
            }
        }
        return n
    }
}
let animals_p = Array(arrayLiteral: "Dog", "Cat", "Dragon", "Tiger")
let animalsCount_p = animals.countIf { (ani) -> Bool in
    return ani.characters.count > 3
}
animalsCount_p

//x==y==z: () can be ignore
let x = animals_p.map({$0+" HH"}).filter(){$0.characters.count > 6}
let y = animals_p.map{$0+" HH"}.filter(){$0.characters.count > 6}
let z = animals_p.map{$0+" HH"}.filter{$0.characters.count > 6}
x
y
z














