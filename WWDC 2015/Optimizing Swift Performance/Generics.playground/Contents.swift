//: Playground - noun: a place where people can play

import UIKit

//wwdc: Optimizing Swift Performance

//How Generics Work

//file1
func min<T: Comparable>(x:T, y:T) ->T{
    return y < x ? y : x
}

//Compiler will be like this:

//==>if T is a Refrence Type
/*
func min_y<T: Comparable>(x:T, y:T, FTable:FunctionTable) -> T{
    let xCopy = FTable.copy(x)
    let yCopy = FTable.copy(y)
    
    let m = FTable.lessThan(yCopy, xCopy) ? y : x
    
    FTable.release(x)
    FTable.release(y)
}
*/

//==>but if is Value Type
/*
min(5, 6)
func min<Int>(x:Int, y:Int) ->Int{
    return y < x ? y : x
}
*/

//visiability difference: =======>Enable Whole Module Optimization
//if file2 and file1 in the same module, it will call min<Int>; or it will call min<T>
func getString(){
    let x = 5
    let y = 6
    min(x, y: y)
}



