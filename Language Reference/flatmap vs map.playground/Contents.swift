//: Playground - noun: a place where people can play

import UIKit


var array = [[1], [3,4], [2,5]]
var countMap = array.map { $0.count }
countMap

var flatMap = array.flatMap{$0.map{$0*10}}
flatMap

var detailFlatMap = array.flatMap { (intArray) -> Array<Int> in
    return intArray.map { $0*10 }
}
detailFlatMap


var array2 = [1, 5, 2]
flatMap = array2.flatMap{$0}
flatMap










