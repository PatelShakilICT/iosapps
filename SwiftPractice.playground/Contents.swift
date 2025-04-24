import UIKit
import Foundation

var greeting = "Hello, playground"
print(greeting)

//single line comment

/* Multi
 line
 comment
 */

var str = "My String"
print(str)


let cons = "this is constant variable"
print(cons)
//cons = "helo"

print("this is string interpolation \(str)")

//Optionals or nullable
var opt : String?
print(opt)//nil
opt = "hello"
print(opt)
print(opt!)

//conditionals
var age = 18
if age >= 18 {
    print("Eligible for voting")
}else{
    print("Not Eligible")
}

//Tuples or Map

let tup : (String ,String) = ("key","value")
print(tup)
print(tup.0)
print(tup.1)


//for in loop
let arr : [String] = ["abc","pqr","xyz"]

for a in arr {
    print(a)
}

//while loop

while age != 20 {
    print(age)
    age += 1
}

//repeat while loop or do while

repeat {
    print("Age : \(age)")
    age -= 1
} while age != 10

    
//Collections
var tups : Array<(String,Int)> = Array()

repeat{
    tups.append(("\(age)Age",age))
    age -= 1
} while age > 5

print(tups)

//array
var ar = [Int]()
ar.append(1)
print(ar)

//Dictionary
var dict : Dictionary<Int,String> = Dictionary()
dict = [1:"abc",2:"something"]
print(dict)
print(dict.keys)
print(dict.values)
print(dict.count)

//Set or distinct array
var set : Set<Int> = Set()
set = [1,35,45,32,1,3,4,5]
print(set)//unique values only


//functions

func hello(){
    print("this is hello")
}

hello()

//classes
class abc {
    public var prop = 1
    
    public func something(a : Int){
        print(prop + a)
    }
}

var a = abc()
a.prop = 4
a.something(a: 40)

//protocol or Interface

protocol myproto {
    func hell() -> Int
}

class impl : myproto {
    func hell() -> Int {
        print("Overridden Func")
        return 0
    }
}

var im = impl()

im.hell()

//structures
struct some {
    func myfun()->String{
        return #function
        
    }
}

var s = some()
print(s.myfun())
print("============API CALLING===============")


func apiCalling()->String{
    if let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    {
        let task = URLSession.shared.dataTask(with: url) { data, response,
            error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with:
                                                                    data, options: [])
                    print(json)
                } catch {
                    print("JSON Error: \(error)")
                }
            }
        }
        task.resume()
    }else{
        print("Some Error Occurred")
    }
    
    return "Response"
}

	Ω//var resp = apiCalling()
