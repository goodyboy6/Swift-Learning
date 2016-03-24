//: Playground - noun: a place where people can play

import UIKit

//https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Attributes.html

//autoclosure： ()->ReturnType
//==========================================
func getServer1(providerInfo block: () -> Dictionary<String, String>){ let dic = block();  print(dic) }
func getServer2(@autoclosure providerInfo block: () -> Dictionary<String, String>){//default is @noescape
    let dic = block();  print(dic)
}
func getServer3(@autoclosure(escaping) providerInfo block: () -> Dictionary<String, String>) {
    dispatch_after(1, dispatch_get_main_queue()) { let dic = block(); print(dic) }
}
getServer1 { () -> Dictionary<String, String> in
    return ["name": "Lilly1"]
}
getServer2(providerInfo: ["name": "Lilly2"])//同步执行
getServer3(providerInfo: ["name": "Lilly3"])//异步执行

//available
//==========================================
// First release
//protocol MyProtocol {
//    // protocol definition
//}
// Subsequent release renames MyProtocol
protocol MyRenamedProtocol {
    // protocol definition
}

@available(*/*支持所有OS*/, introduced=2.1/*引入版本*/, deprecated=2.2, renamed="MyRenamedProtocol"/*推荐使用提示*/, message="Good day")//unavailable,obsoleted=2.2/*隔离版本*/,
typealias MyProtocol = MyRenamedProtocol

struct Person:MyProtocol {
    var name:String?
}

@available(iOS 10.0, OSX 10.10, *)
class MyClass {}
if #available(iOS 10.0, *) {
    var aClass = MyClass()
} else {
    // Fallback on earlier versions
}

//objc
//==========================================
//Apply this attribute to any declaration that can be represented in Objective-C—for example, non-nested classes, protocols, nongeneric enumerations (constrained to integer raw-value types), properties and methods (including getters and setters) of classes and protocols, initializers, deinitializers, and subscripts. The objc attribute tells the compiler that a declaration is available to use in Objective-C code.
@objc
class ExampleClass: NSObject {
    var enabled:Bool{
        @objc(isEnabled) get{
            return true
        }
    }
}

//noescape
//==========================================
//Apply this attribute to a function or method declaration to indicate that a parameter will not be stored for later execution
func getInfo1(@noescape providerInfo: (name:String)->Dictionary<String, String>){
    let info = providerInfo(name: "Jack");
    print(info)
}
func getInfo2(@noescape providerInfo: (name:String)->Dictionary<String, String>){
    let info = providerInfo(name: "Jack");
    print(info)
}

//nonobjc
//==========================================
extension Person{
    @nonobjc var propertyThatObjCCanNotSee:String {
        return ""
    }
}

//noreturn
//==========================================
//http://stackoverflow.com/questions/27829132/convincing-swift-that-a-function-will-never-return-due-to-a-thrown-exception
extension Person{
    
    func getRealName() ->String {
        @noreturn func abort() -> String{}
        guard let n = name else{
            abort()
        }
        return n + "_real"
    }
}
Person(name:"ttttt").getRealName()
//Person().getRealName()//Crash: Execution was interrupted, reason: EXC_BAD_ACCESS

//UIApplicationMain/NSApplicationMain
//==========================================
//Apply this attribute to a class to indicate that it is the application delegate.
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//}


//NSCopying
//==========================================
//@NSCopying is only valid with types that conform to the NSCopying protocol
//@NSCopying may only be used on properties in classes
class ExampleClass2{
    @NSCopying var swillingName:NSString = ""
}


//tastable
//==========================================
//https://www.natashatherobot.com/swift-2-xcode-7-unit-testing-access/
//import XCTest
//@testable import ProjectName
//class ProjectNameTests: XCTestCase {
//}


//warn_unused_result
//==========================================
//For example, the Swift standard library provides both the mutating method sortInPlace() and the nonmutating method sort() to collections whose generator element conforms to the Comparable protocol. If you call the sort() method without using its result, it’s likely that you actually intended to use the mutating variant, sortInPlace() instead.
struct ExampleStruct{
    var name:String
    mutating func changeName(newName:String){
        name = newName
    }
}
extension ExampleStruct{
    @warn_unused_result (message="ttttt", mutable_variant="changeName")
    func testCodeFunc()->Bool{
        return true
    }
}
var tt = ExampleStruct(name:"uuu").testCodeFunc()
tt


//Declaration Attributes Used by Interface Builder
//==========================================
//IBAction, IBDesignable, IBInspectable, and IBOutlet. 
//These attributes are conceptually the same as their Objective-C counterparts.


//convention:数据转换
//==========================================
//http://stackoverflow.com/questions/30740560/new-conventionc-in-swift-2-how-can-i-use-it
//http://swift.gg/2015/09/01/friday-qa-2015-06-19-the-best-of-whats-new-in-swift/

//任何 Swift 函数类型都可以选择性地通过@convention标识符来进行注解，以此说明函数类型。默认的标注是swift，表示这是一个正常的 Swift 函数。标注为block则说明这是 OC 中的block类型。这些一直都是自动桥接的，但是现在书写方式更加明确。最后，c标注表明这是一个 C 语言函数指针。通过@convention(c)标注的函数类型在多数情况下表现正常，所以你可以像往常那样调用并传递他们。


//swift, block, c
//==>c
//CGFloat myCFunction(CGFloat (callback)(CGFloat x, CGFloat y)) {
//    return callback(1.1, 2.2);
//}
//==>Swift
//func myCFunction(@convention(c) param: (CGFloat, CGFloat)->CGFloat) -> CGFloat{
//    return param(1.1, 1.2)
//}
//let result = myCFunction( { (x, y) -> CGFloat in
//    return x + y
//})

//The type dispatch_block_t now refers to the type @convention(block) () -> Void, as it did in Swift 1.2. This change allows programs using dispatch_block_create to work as expected, solving an issue that surfaced in Xcode 7.0 with Swift 2.0.
public typealias dispatch_block_t = @convention(block) () -> Void

var objCArray:NSArray = NSArray(objects: "s", "t", "a", "r", "t")
objCArray.enumerateObjectsUsingBlock { (String, idx, stop) in
    
}

















