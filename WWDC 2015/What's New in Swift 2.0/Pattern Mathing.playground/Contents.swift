//: Playground - noun: a place where people can play

import UIKit

//wwdc: What's new in Swift 2.0

enum Either<T1, T2>{
    case First(T1)
    case Second(T2)
}

//1)"do" statement ==> repeat
var max = 0
repeat{
    //
    //lot of code here
    //
    max++
}while max < 10
max

//2)Option Set
//let op1:UIViewAnimationOptions = .Repeat | .CurveEaseIn | .TransitionCrossDissolve
//==>
let op1:Array<UIViewAnimationOptions> = [.Repeat, .CurveEaseIn, .TransitionCrossDissolve]
if op1.contains(.Repeat){
    print("contains Repeat")
}

//Defining an Option Set
struct MyFontStyle: OptionSetType{//protocol-oriented programing
    let rawValue: Int
    
    static let Bold = MyFontStyle(rawValue: 1)
    static let Italic = MyFontStyle(rawValue: 2)
    static let Underline = MyFontStyle(rawValue: 3)
    static let StrikeThrougn = MyFontStyle();
}

var fontStyles:Array<MyFontStyle> = [.Bold, .Italic];
if fontStyles.contains(.Bold){
    print("contains Bold")
}

//3)Functions and Methods
func save(name:String, encrypt:Bool){}
save("Lily", encrypt: true)//"encrypt:" default

func save(name name:String, encrypt:Bool){}
save(name: "Lily", encrypt: true)

func save(name name:String, _ encrypt:Bool){}
save(name: "Lily", true)

//4)Diagnostics
struct MyCoordinates {
    var point:CGPoint;
    
    mutating func changePointTo(p:CGPoint){//add mutating
        point.x = p.x;
        point.y = p.y;
    }
}

//5)if let statement
func changeNameOrNot(newName:String?){
    let shouldChange:Bool? = true
    
    if let name = newName, let _ = shouldChange where newName == "hello"{//many if let..let..
        print("change to \(name)")
    }else{
        print("not change name")
    }
}

//"guard" statement
func process(json: AnyObject)->Either<String, Int> {
    
    let name:String? = json["name"] as? String
    
    if name == nil{
        return .First("lost name")
    }
    
    return .First(name!)
}
process(["name":"Big Bong"])
process(["no result":""])

//if else==> guard else
func process_guard(json: AnyObject)->Either<String, Int> {
    
    guard let name:String? = json["name"] as? String, let year = json["year"] as? Int else{
        return .First("lost name or year")
    }
    
    print(name! + " \(year) years old")
    
    return .Second(year)
}
process_guard(["name":"Big Bong", "year":33])
process_guard(["no result":"bb", "year":""])

//6)Pattern Mathing with Switch
func choose()->Either<Int, Int>{
    return Either.Second(8)
}

func doThings(thing:String){
    print(thing);
}

switch choose() {
    case .First(let f) where f != 8: print("first \(f)")
    default: doThings("nothing")
}
//switch ==> if case
if case .First(let f) = choose() where f != 8{
    doThings("first \(f)")
}else if case .Second(let f) = choose() {
    doThings("second \(f)")
}else{
    doThings("nothing")
}

//7)for...in
var sequence:Array = Array(arrayLiteral: "1","3","2","")

for var string in sequence{
    if string != ""{
        doThings(string)
    }
}
//==>for in case
for var string in sequence where string != ""{
    doThings(string)
}

var sequence_Enums:[Either<Int, Int>] = Array(arrayLiteral: .First(1),.First(3),.First(2), .Second(3))
for case .First(let tt) in sequence_Enums{
    doThings("for case First: \(tt)")
}
for case .Second(let tt) in sequence_Enums{
    doThings("for case Second: \(tt)")
}























