//: Playground - noun: a place where people can play

import UIKit

//wwdc: Optimizing Swift Performance

//1)keyword: final
public class Pet{//in another module, it can be seen
    func noise(){ noiseImpl() }

    final var name:String?//compiler knows it's final, subclass
    private func noiseImpl(){ print(name) }//private in file
}

class Dog: Pet {
    override func noise() {
        print("my name is \(name)")
        super.noise()
    }
    //==>Compiler will be like this
    /*
    func makeNoise(p: Pet){
        //if final var name:String? the two line will be gone
        let nameGetter = Pet.getNameGetter(p)
        print("my name is \(nameGetter(p))")
        
        let noiseMethod = Pet.getNoiseMethod(p)
        noiseMethod(p);
    }
    */
}


var dog = Dog()
dog.noise()

//2)Communicate you API Intent
//Use the final keyword and accesss control
//*help the compiler understand you class hierarchy
//*be aware of break existing clients

//Enable Whole Module Optimization

final class Cat: Pet{
//do not let allow inheritated,
}


//NilLiteralConvertible
//if a obj is not Optional, it will now allow to be nil. so compiler error when : "var b:String = nil"
//1)contains value
var a:String? = "tttttttttttttttt"
print(a)
//compiler see this:
var opt:Optional<String> = Optional.init("tttttttttttttttt")
print(opt)

//2)nil value
var b:String? = nil
print(b)
//compiler see this:
//var optb:Optional = Optional(nilLiteral: ())//NilLiteralConvertible Protocol
//print(optb)

//3)
print("\(a!)")//compiler will get value from Some(T)



