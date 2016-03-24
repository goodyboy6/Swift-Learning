//: Playground - noun: a place where people can play

import UIKit

//WWDC: Building Better Apps with Value Types in Swift

///CustomStringConvertible
struct Car:CustomStringConvertible{
    var name:String
    var produceDate:NSDate
    
    var description: String{
        return "Car name is \(name) produced on \(produceDate))"
    }
}
struct Cars:SequenceType {
    var carList:[Car] = []
    
    func generate() -> AnyGenerator<Car> {
        var index:Int = carList.count - 1;
        
        return AnyGenerator(body: {() -> Car? in
            guard index >= 0 else{
                return nil;
            }
            let i = index
            index = index.predecessor()
            return self.carList[i]
        })
    }
}

var cars = Cars();
let aCar1 = Car(name: "BMW", produceDate: NSDate())
let aCar2 = Car(name: "BYD", produceDate: NSDate())
let aCar3 = Car(name: "Audo", produceDate: NSDate())
cars.carList = [aCar1, aCar2, aCar3];
for car in cars{
    print("\(car)")
}

///

