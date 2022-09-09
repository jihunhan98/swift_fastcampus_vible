import UIKit

//var은 변수 let은 상수
var num = 5
num = 1

//let name = "jihun"
//name = "dkdwdqw"

let num1 = 5
let onum = num1 / 2


//배수 확인 of: 3 => 3의 배수인지
let num2 = 360
print(num1.isMultiple(of: 3))


//0~300의 정수형 랜덤수
let random = Int.random(in: 0...300)

//type을 확인할 때에는 변수에 option키를 눌러 확인
let score = 3.6

//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

var isSingle = true
isSingle.toggle()
//toggle은 bool값의 반댓값

let diffc = "쉽다"
let maxage = 80

let messgae = "\(maxage) 살 먹은 할머니도 배우는 IOS는 \(diffc)"
// 역슬래쉬(\)는 데이터를 문자열로 표현

//Array
var ages = [10, 20, 30]
var colors = ["green", "red", "yellow"]

//dict
let language_dict = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "ja"
]
let code = language_dict["한국"]

//empty array, dict
var emptyArr: [Int] = []
var emptyDict: [String: Any] = [:]

//enum(서로 관계있는 값들의 집합)

enum WeekDay{
    case mon
    case tue
    case wed
    case thu
    case fri
}

var today = WeekDay.mon
var tommrow: WeekDay = .thu

//enum에 value값을 넣을 수도 있음
enum MediaType{
    case audio(String)
    case video(String)
}

var mp3: MediaType = .audio("mp3")
var h264: MediaType = .video("h264")

//조건문 => 한줄이여도 조건문에 {}괄호 넣어야함.

let age = 10

if age > 10{
    print("성인입니다")
}
else{
    print("미성년 입니다")
}

if age >= 10 && age < 20{
    print("10대입니다")
}
else if age >= 20 && age < 30{
    print("20대입니다")
}
else if age >= 30 && age < 40{
    print("30대입니다")
}
else{
    print("else")
}

//enum을 통한 switch문

enum Weather{
    case sun
    case cloud
    case rain
}

var weather: Weather = .rain

switch weather{
case .sun:
    print("맑아요")
case .rain:
    print("바와요")
case .cloud:
    print("흐려요")
}

//array for문
let arr = [31, 231, 32, 21, 32]

for i in arr{
    print("arr = \(i)")
}
// dict for문

let language_dict2 = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "ja"
]

for (key, value) in language_dict2{
    print("key = \(key), value = \(value)")
}

//변수는 필요없고 단순 반복만 하는

for _ in 0...10{
    print("hello")
}

//while 반복문

var count = 10

print("ready")

while(count > 0){
    print(count)
    count -= 1
}


//Optional => type? : 값이 있을 수도 있고 없을 수도 있다

let krCode = language_dict2["한국"]
let jpCode = language_dict2["일본"]
let usCode = language_dict2["미국"]
let gerCode = language_dict2["독일"]  //없는 값은 nil로 표현

var name: String? = nil  //nil은 아무것도 없는 값(null)

name = "jihun"
//
////함수
//
////단을 입력하면 그 단의 구구단을 출력
func printGugu(dan: Int){
    for i in 1...9{
        print("\(dan) * \(i) = \(dan*i)")
    }
}
//
//printGugu(dan: 5)
//
////1부터 30까지 랜덤 수 출력 함수
//// func -> Int : 반환형이 Int라는 것
//func rollDice() -> Int{
//    return Int.random(in: 1...30)
//}
//
//let rand = rollDice()

//함수 자체를 상수에 넣어 함수처럼 사용 가능

var number = printGugu
number(8)

//클로저 : 이름없는 함수를 상수에 할당
let helloName = { (name: String) in
    print("hello my name is \(name)")
}
helloName("jihun")

//구조체
struct Album{
    let title:String
    let artist:String
    var isReleased = false

    func description() -> String {
        return "\(title) by \(artist)"
    }
    //mutating은 자신의 프로퍼티를 변경할때 쓰는 키워드
    mutating func release(){
        self.isReleased = true
    }
}

var easyOnMe = Album(title: "Easy On Me", artist: "Adele")
print(easyOnMe)
// 구조체 변수를 바꾸는 함수
easyOnMe.release()
print(easyOnMe.isReleased)
easyOnMe.release()

//클래스

class Employee {
    var name: String
    var hours: Int
    
    init(name: String, hours: Int) {
        self.name = name
        self.hours = hours
    }
    
    func work() {
        print("I'm working now...")
    }
    
    func summary() {
        print("I work \(self.hours) hours a day. ")
    }
}

class iOSDeveloper: Employee {
    
    override func work() {
        print("I'm developing iOS app now.")
    }
    
    override func summary() {
        print("I work \(self.hours/2) hours a day.")
    }
}

struct Phone {
    var modelName: String
    var manufacturer: String
    var version: Double = 1.0
}

let normalWorker = Employee(name: "Kim", hours: 8)
normalWorker.work()
normalWorker.summary()
//    I'm working now...
//    I work 8 hours a day.

let developer = iOSDeveloper(name: "Jason", hours: 8)
developer.work()
developer.summary()
//    I'm developing iOS app now.
//    I work 4 hours a day.

// 클래스는 참조, 구조체는 복사
var iPhone1 = Phone(modelName: "iPhone 13", manufacturer: "Apple")
var iPhone2 = iPhone1
iPhone2.modelName = "iPhone 14"
print(iPhone2.modelName)
print(iPhone1.modelName)
//    iPhone 14
//    iPhone 13

var jrDeveloper1 = iOSDeveloper(name: "John", hours: 8)
var jrDeveloper2 = jrDeveloper1
jrDeveloper1.name = "Billy"
print(jrDeveloper1.name)
print(jrDeveloper2.name)

//클래스는 참고, 구조체는 복사

//프토토콜 => 기능이나 속성을 미리 정의해 놓은 것 ex) 반장의 역할

protocol Coach {
    var name: String { get set }
    var currentTeam: String {get}
    func training()
    func direct()
}

struct Mourinho: Coach {
    var name: String = "Jose Mourinho"
    var currentTeam: String = "AS Roma"
    
    func training() {
        print("Traning Player")
    }
    
    func direct()
    {
        print("Direct Game")
    }
}

let mourinho = Mourinho()
print("\(mourinho.name), \(mourinho.currentTeam)")
mourinho.training()
mourinho.direct()


//익스탠션 => 기존 타입에 새로운 기능과 속성을 추가
extension String {
    func contains(s: String) -> Bool {
        return self.range(of: s) != nil
    }
    
    func replace(target: String, with: String) -> String {
        return self.replacingOccurrences(of: target, with: with)
    }
    //replacingOccurrences => 문자열 target 대신 with으로 치환하여 return
}


let testString = "Hello iOS Developer!!"
testString.contains(s: "Hello")
let replace = testString.replace(target: "iOS", with: "Android")
