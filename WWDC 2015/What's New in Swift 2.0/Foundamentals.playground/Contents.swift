//: Playground - noun: a place where people can play

import UIKit

//wwdc: What's new in Swift 2.0

enum Animals{
    case Dog, Cat, Troll, Dragon
}
let animal = Animals.Dragon
print(animal)


//==>associated value in enum
enum Either<T1, T2>{
    case First(T1)
    case Second(T2)
}
let e = Either<String, Int>.Second(12)//how to use!
print(e)


//==>recursive Enums
enum Tree<T>{
    case Leaf(T)
    indirect case Node(Tree, Tree)
}
let t = Tree<Int>.Node(Tree<Int>.Leaf(33), Tree<Int>.Leaf(66))//how to use!
print(e)













