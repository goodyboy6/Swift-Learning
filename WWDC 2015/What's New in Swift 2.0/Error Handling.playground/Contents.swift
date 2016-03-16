//: Playground - noun: a place where people can play

import UIKit

//wwdc: What's new in Swift 2.0


//Kind of Eoor
//1)Trivial errors: Int(sth) can fail
//2)Logic errors: Assertions, overflows,NSException, etc
//3)Detailed, recoverable errors: File not found; Network failure; User canclelation...
func preflight(inout error:NSError?)->Bool{
    
    func checkRsourceIsReachableAndReturnError(inout error:NSError?)->Bool{
        error = NSError(domain: "alibaba.com", code: 404, userInfo: nil)
        return false
    }

    if !checkRsourceIsReachableAndReturnError(&error){
        return false
    }
    
    return true
}

//==> pattern with "catch"
func preflight_handling(inout error:NSError?) ->Bool{
    
    func checkRsourceIsReachableAndReturnError(inout error:NSError?) throws ->Bool{
        guard error != nil else{
            error = NSError(domain: "alibaba.com", code: 404, userInfo: nil)
            throw error!
        }
        
        return false
    }
    
    do{
        try checkRsourceIsReachableAndReturnError(&error)
        print("preflight_handling ture")
        return true
    }catch NSURLError.FileDoesNotExist{
        print("NSURLError.FileDoesNotExist")
        return false;
    }catch let error{
        print("preflight_handling \(error)")
        return false
    }
}
//var error:NSError?
//preflight_handling(&error)

//==> Enums as Error Types
enum DataErrorType: ErrorType{
    case FileExist, FileNotExist
}

func preflight_handling_return_enums(inout error:NSError?) ->Bool{
    
    func checkRsourceIsReachableAndReturnError(inout error:NSError?) throws ->Bool{
        guard error != nil else{
            throw DataErrorType.FileNotExist
        }
        return true
    }
    
    defer { print("defer keyword printed") }//implement after do catch whether throw or not, like “finally” in "try/finally" in Java. this shoule be overhead "do catch"

    do{
        try checkRsourceIsReachableAndReturnError(&error)
        print("preflight_handling_return_enums ture")
        return true
    }catch NSURLError.FileDoesNotExist{
        print("NSURLError.FileDoesNotExist")
        return false;
    }catch let error{
        print("preflight_handling_return_enums \(error)")
        return false
    }
    
}
var error:NSError?
preflight_handling_return_enums(&error)

//==>
//Swift 1.0
extension NSData{
    class func dataOfContentURL_1(fileURL:NSURL, error:NSErrorPointer) -> NSData?{
        return nil
    }
}
//Swift 2.0
extension NSData{
    class func dataOfContentURL_2(fileURL:NSURL) throws -> NSData{
        return NSData()
    }
}






