//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Release Note: https://developer.apple.com/library/mac/releasenotes/DeveloperTools/RN-Xcode/Chapters/Introduction.html#//apple_ref/doc/uid/TP40001051
//Swift change Log: https://github.com/apple/swift/blob/swift-2.2-SNAPSHOT-2015-12-18-a/CHANGELOG.md

//1)You can guard statements and declarations with a new #if swift(>=x.y) build configuration
#if swift(>=2.3)
    print("swift 2.0")
#elseif swift(>=1.2)
    print("swift 2.2")
#endif

//2)All slice types have removeFirst() and removeLast() methods. Additionally, ArraySlice.removeFirst() preserves element indices
var array = Array(arrayLiteral: 1,2,3,2,1,2,5,6,7,7,8,8,9,9,9,0,0,0,0,0)
var slice = array[0...array.count-1]
slice
let last = slice.removeLast()
slice
let first = slice.removeFirst()
slice
slice.removeFirst(2)
slice

//3)Anonymous structs from C are imported as nested struct types in Swift
struct Person:CustomStringConvertible{//nested struct types
    
    //nested enumration
    enum Sex:String {
        case Male = "Male", Female = "Female"
    }
    
    var name:String
    var sex:Sex
    
    var description: String{
        return "\(person.name) is a \(person.sex)"
    }
}
let person = Person(name: "Mike", sex: Person.Sex.Male)

//4)
/*
 Three new doc comment fields allow Swift users to cooperate with code completion engine to deliver more effective code completion results:
 - keyword: specifies concepts that are not fully manifested in declaration names.
 - recommended: indicates other declarations are preferred to the one decorated.
 - recommendedover: indicates the decorated declaration is preferred to those declarations whose names are specified.
 (23101030)
 */


//5)Inside a class, a designated initializer that is either failable (init?()) or throwing (init() throws) is allowed to exit before initializing all stored properties and calling super.init(). This behavior makes designated initializers more consistent with convenience initializers. Convenience initializers can also fail before performing a self.init() delegation.  (18216578)
class Dog:NSObject{
    
    enum ErrorCreation:ErrorType {
        case Failure, Success
    }
    
    var name:String
    var age:Int
    
    init(name n:String, age a:Int) throws{
        
        guard a > 10 else{
            throw ErrorCreation.Failure
        }

        self.name = n
        age = a
        super.init()
    }
    
    override var description: String{
        return "Dog name is \(name), age \(age)"
    }
}
var dog = try Dog(name: "Kale", age: 11)

do{
    var dog2 = try Dog(name: "Kale", age: 8)
}catch let error{
    print("\(error)")
}

//6)Curried function syntax has been deprecated, and is slated to be removed in Swift 3. (23364870)
//what's Curry?
//func curryUnnamed(a: Int)(_ b: Int)->Int { return a + b }
//curryUnnamed(1)(2)


//7)The ++ and -- operators have been deprecated and are slated to be removed in Swift 3.0.  As a replacement, use x += 1 on integer or floating point types and x = x.successor() on Index types. (23708702)
var x = 0
//x++
x += 1
x
x = x.successor()
x

//8) Associated types in protocols can be specified with a new associatedtype declaration, to replace the use of typealias.
//The typealias keyword is still allowed in Swift 2.2, although it is deprecated and produces a warning. This warning will become an error in Swift 3.
protocol P{
    associatedtype U //<====typealias U
    func get(obj: U) -> U;
}
struct Detail:P {
    func get(obj: String) -> String {
        return obj
    }
}
var detail = Detail().get("tttttttttt")


//9)When referencing a function or initializer, one can provide the complete name, including argument labels.
class TestView:UIView{
    var superView:UIView{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = UIColor.yellowColor()
        return view;
    }
    
    var button:UIButton{
        let b = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        b.backgroundColor = UIColor.redColor()
        b.addTarget(self, action: #selector(changeColor(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return b;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        superView.addSubview(button)
        self.addSubview(superView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.performSelector(#selector(changeColor(_:)), withObject: button)
        print(NSStringFromSelector(#selector(touchesBegan(_: withEvent:))))
    }
    
    func changeColor(button:UIButton) {
        var time = 1;
        button.backgroundColor = (time%2 == 0) ? UIColor.cyanColor() : UIColor.blueColor();
        time = time.successor()
    }
}
var blackView = TestView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
var view = blackView.superView

//10) Global anyGenerator() functions have been changed into initializers on AnyGenerator, in order to help make the API more intuitive and idiomatic. The anyGenerator() functions have been deprecated in Swift 2.2 and will be removed in Swift 3. 
//What's AnyGenerator? http://stackoverflow.com/questions/31730127/add-for-in-support-to-a-class-in-swift-2
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

//11)The @objc(SomeName) attribute is supported on enums and enum cases to rename the generated Objective-C declaration. (21930334)
//only support Int type
//http://stackoverflow.com/questions/24206732/cant-use-swift-classes-inside-objective-c
@objc enum Sequence:Int {
    case F, S, T
}


//12)The Objective-C selector of a Swift method can be determined directly with the #selector expression
let sel: Selector = #selector(UIView.insertSubview(_:aboveSubview:))//<== let sel: Selector = "insertSubview:aboveSubview:"
//in swift
let sel2: Selector = Selector("propertyName")

//12)
/*
 Closures appearing inside generic types and generic methods can now be converted to C function pointers as long as no generic type parameters are referenced in the closure's argument list or body. A conversion of a closure that references generic type parameters now produces a diagnostic instead of crashing.
 
 (rdar://problem/22204968)
 */


//13)Field getters and setters are now created for named unions imported from C. In addition, an initializer with a named parameter for the field is provided
//objctive-c
//typedef union IntOrFloat {
//    int intField;
//    float floatField;
//} IntOrFloat;

//==>Swift
//struct IntOrFloat {
//    var intField: Int { get set }
//    init(intField: Int)
//    
//    var floatField: Float { get set }
//    init(floatField: Float)
//}


//14)dispatch_block_t:  public typealias dispatch_block_t = @convention(block) () -> Void
var tt:dispatch_block_t = { ()->Void in
    
}

//15) the startUserActivity() method is available on iOS 8.0+, on OS X v10.10+, and on all versions of any other platform.
@available(iOS 8.0, OSX 10.10, *)
func startUserActivity() -> NSUserActivity? {
    return nil
}

//16)A new @nonobjc attribute is introduced to selectively suppress ObjC export for instance members that would otherwise be @objc. (16763754)
//https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Attributes.html
@objc class Girl:NSObject{
    var propertyThatObjCCanSee:String = ""
    @nonobjc var propertyThatObjCCanNotSee:String = ""
}

//do statement
do{
    print("hrllo")
    do{
        print("hrllo")
    }
}


//Fields of C structs that are marked __unsafe_unretained are presented in Swift using Unmanaged.


//Nonmutating methods of structs, enums, and protocols may now be partially applied to their self parameter:
let a: Set<Int> = [1, 2, 3]
let b: [Set<Int>] = [[1], [4]]
b.map(a.union)
b.map { (s) -> Set<Int> in
    return a.union(s)
}

//Enums and cases can now be marked indirect, which causes the associated value for the enum to be stored indirectly, allowing for recursive data structures to be defined. For example:
enum List<T> {
    case Nil
    indirect case Cons(head: T, tail: List<T>)
}

indirect enum Tree<T> {
    case Leaf(T)
    case Branch(left: Tree<T>, right: Tree<T>)
}

