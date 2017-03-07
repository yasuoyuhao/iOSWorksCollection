//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//init() {
//    // perform some initialization here
//}

// 定義一個類別 SomeClass 並在建構器中指派初始值給屬性 number
class SomeClass {
    let number: Int
    
    init() {
        number = 12
    }
}

//設置儲存屬性的初始值
//
//在建構過程結束前，這個類別的儲存屬性都必須被指派一個明確的值，可以是定義時直接指派，或是在建構器中為屬性指派。如下：
class SomeClass2 {
    let number: Int = 20
    let anotherNumber: Int
    
    init() {
        anotherNumber = 12
    }
}
//上述程式可以看到，有一個屬性是定義時即指派值，另一個屬性則是在建構器中被指派。



//可選型別的屬性
//
//如果一個儲存屬性依照需求或規劃，在建構過程中沒有辦法被指派或是需要在之後可以被設置為nil，可以將其定義為可選型別(optional type)，這樣它會被初始化為nil，則建構過程中可以不用被指派值，例子如下：
class OneQuestion {
    var question: String
    
    // 可選型別 即可在建構過程時不用指派值
    var answer: String?
    
    init() {
        // 僅指派一個型別為 String 的屬性
        question = "問題的題目"
    }
}

let someQuestion = OneQuestion()
// 這時才將 anser 指派值
someQuestion.answer = "答案隨後跟上"


//使用閉包或函式設置屬性的預設值
//
//可以使用閉包或全域函式來為屬性提供預設值，以下是一個閉包的例子：
class SomeClass3 {
    let numbers: [Int] = {
        var temporaryNumbers = [Int]()
        var isBlack = false
        for i in 1...10 {
            temporaryNumbers.append(i)
        }
        return temporaryNumbers
    }()
}
//上述程式可以看到閉包後緊接著一對小括號()，表示要立即執行這個閉包並返回閉包的值。


//為建構器提供參數
//
//建構器可以加入參數，使用方式與函式(或方法)類似，例子如下：
struct SimpleMath {
    var number: Double
    init(huge n: Double) {
        number = n * 100
    }
    init(tiny n: Double) {
        number = n / 10
    }
}

let oneSimpleMath = SimpleMath(huge: 30.0)
// 印出 3000.0
print(oneSimpleMath.number)

let anotherSimpleMath = SimpleMath(tiny: 10.0)
// 印出 1.0
print(anotherSimpleMath.number)

//上述程式為一個結構，可以看到建構器可以不只有一個，由參數的不同來辨別要使用哪一個建構器。
//與函式(或方法)相同，建構器定義參數時也需要參數標籤(argument label 用於初始化)及參數名稱(parameter name 在init()內部使用)。


//參數標籤及參數名稱
//
//與函式(或方法)一樣，可以使用其參數名稱作為參數標籤，如下：
// 定義一個結構 有兩個建構器
struct Color {
    let red, green, blue: Double
    
    // 這個建構器有寫 參數標籤 跟 參數名稱
    init(red r: Double, green g : Double, blue b: Double) {
        self.red   = r
        self.green = g
        self.blue  = b
    }
    
    // 這個建構器則是合併成一個參數名稱
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

var oneColor = Color(red: 0.9, green: 0.5, blue: 0.5)
var anotherColor = Color(white: 1.0)


//省略參數標籤
//
//與函式(或方法)一樣，可以省略其參數標籤，使用下底線_替代參數標籤，如下：
struct SomeNumbers {
    let number: Int
    // 使用下底線 _ 表示要省略參數標籤
    init(_ n: Int) {
        number = n
    }
}

// 生成一個實體時 參數前就不需要有參數標籤
var oneNumbers = SomeNumbers(9)

//結構的成員逐一建構器
//
//前面章節有提到，當結構沒有自定義的建構器時，會自動生成一個成員逐一建構器，以下是一個例子：
struct CharacterStats {
    var hp = 0.0
    var mp = 0.0
}

let someoneStats = CharacterStats(hp: 120, mp: 100)

//值型別的建構器委任
//
//建構器委任(initializer delegation)指的是建構器可以呼叫其他建構器來完成生成實體時的部份建構過程，可以整合及減少多個建構器間的程式碼重複。
//值型別(結構及列舉)沒有繼承這個特性，所以建構器委任相對簡單，值型別(結構及列舉)只能委任本身的其他建構器。
//在自定義的建構器中使用self.init來委任(也就是呼叫)其他建構器，需要注意只能在建構器內使用self.init，以下是個例子：
// 定義兩個示範需要用到的結構
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

// 定義一個方形的結構 Rect
struct Rect {
    // 使用上面兩個定義的結構來儲存這個方形的原點及尺寸
    var origin = Point()
    var size = Size()
    
    // 三個建構器
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(
            origin: Point(x: originX, y: originY), size: size)
    }
}
//上述程式中可以看到結構Rect有三個建構器，以下會依序生成由這三個建構器初始化的實體。
//使用第一個建構器init()，這是預設建構器，其內沒有設置任何屬性，所以生成的這個實體的屬性皆是使用預設值，如下：
let basicRect = Rect()
// basicRect 內的屬性的值分別為
// origin 為 (0.0, 0.0)
// size 為 (0.0, 0.0)
//使用第二個建構器init(origin:size:)，簡單的將屬性指派為新的值，如下：
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),size: Size(width: 5.0, height: 5.0))
// originRect 內的屬性的值分別為
// origin 為 (2.0, 2.0)
// size 為 (5.0, 5.0)
//使用第三個建構器init(center:size:)，第一個參數是這個方形的中心點座標，這個建構器會先利用中心點與尺寸的長寬來算出原點的位置，再委任(也就是呼叫)另一個建構器init(origin:size:)來為屬性指派新的值，如下：
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),size: Size(width: 3.0, height: 3.0))
// centerRect 內的屬性的值分別為
// origin 為 (2.5, 2.5)
// size 為 (3.0, 3.0)


//類別的繼承與建構過程
//
//類別可以繼承其他的類別(當然也包含屬性)，為了確保在類別的建構過程中，儲存屬性(包含本身的及繼承自父類別的)都設置了初始值，Swift 提供了兩種建構器，分別是指定建構器和便利建構器。
//指定建構器與便利建構器
//
//指定建構器(designated initializer)是類別中最主要的建構器，負責在初始化時給所有無預設值的屬性指派一個值，還需要負責委任(也就是呼叫)父類別的建構器來完成父類別的初始化，每個類別至少要有一個指定建構器。
//便利建構器(convenience initializer)是輔助型的建構器，可以委任類別本身其他的建構器，最後必須以委任一個指定建構器結束。便利建構器不是一定需要，你可以依需求定義便利建構器，來使得生成實體時可以更明確或更快速的知道這個建構器的目的。
//指定建構器的格式如下：
//init(參數) {
//    執行的建構過程
//}
//便利建構器的格式是在init前面加上convenience關鍵字，如下：
//convenience init(參數) {
//    執行的建構過程
//}



//類別的建構器委任
//
//類別的指定建構器與便利建構器委任關係規則如下：
//便利建構器的建構過程中，必須委任類別本身中的另一個建構器(可以是指定建構器或便利建構器)。
//便利建構器可以一直委任另一個便利建構器(一個接著一個)，但最後必須要委任一個指定建構器。
//指定建構器必須要委任其父類別的指定建構器(如果有父類別的話)。
//一個簡單的記憶方法為：
//便利建構器必須橫向委任。
//指定建構器必須向上委任。
//建構器的繼承與覆寫
//
//Swift 的類別預設不會繼承父類別的建構器，在有需求時可以手動覆寫。
//覆寫父類別的指定建構器時，必須在建構器(不論覆寫成為指定建構器或便利建構器)前面加上關鍵字override。
//覆寫父類別的便利建構器時，前面則不需要加上override，直接重新定義即可。
//建構器的自動繼承
//
//前面提到類別預設不會繼承父類別的建構器，但在以下兩個規則且此類別的屬性都有預設值時，建構器會自動繼承：
//子類別沒有定義任何指定建構器，則會自動繼承父類別所有的指定建構器。
//子類別實作了父類別所有的指定建構器(不論是上述規則 1 來的，或是自己定義實作的)，則會自動繼承父類別所有的便利建構器。
//指定建構器與便利建構器的示範
//
//以下例子會依序定義三個類別GameCharacter、Archer跟Hunter，用來示範指定建構器、便利建構器與建構器的自動繼承。
//首先定義一個基礎類別GameCharacter，如下：
class GameCharacter {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[未命名]")
    }
}
//上述程式中，類別GameCharacter有兩個建構器：
//init(name: String)為一個指定建構器，確保所有儲存屬性都設置到值。
//init()為一個沒有參數的便利建構器，但建構過程中會委任類別中另一個指定建構器init(name: String)，並將一個值作為參數傳入。
//以下為使用不同建構器生成的實體：
// 使用指定建構器 生成實體後的屬性 name 為: Kevin
let oneChar = GameCharacter(name:"Kevin")

// 使用便利建構器 生成實體後的屬性 name 為: [未命名]
let anotherChar = GameCharacter()
//接著定義一個繼承自GameCharacter的類別Archer：
class Archer: GameCharacter {
    var attackRange: Double
    init(name: String, attackRange: Double) {
        self.attackRange = attackRange
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, attackRange: 1)
    }
}
//上述程式中，類別Archer新增了一個屬性attackRange，且有兩個建構器：
//init(name: String, attackRange: Double)為一個指定建構器。
//先將傳入的attackRange指派給新增的屬性，接著會向上委任父類別的建構器init(name: String)。
//這邊要注意，類別本身的屬性都有設置初始值之後，才能向上委任父類別的建構器，讓父類別繼續進行它自己屬性的設置初始值。
//init(name: String)為一個便利建構器。
//簡單的傳入一個參數name，並設置一個固定的值給attackRange，最後委任本身的指定建構器init(name: String, attackRange: Double)，完成指派值給屬性的工作。
//可以觀察得到，這是覆寫父類別的指定建構器，所以前面必須加上override關鍵字。
//這個便利建構器的定義可以讓生成實體更為簡潔，當需要生成多個實體時可以避免程式碼的冗餘。
//因為類別Archer實作了其父類別GameCharacter所有的指定建構器，所以自動繼承了GameCharacter所有的便利建構器。以下為使用不同建構器(也包含繼承自父類別的建構器)生成的實體：
// 繼承自父類別的建構器
let oneArcher = Archer()

// 覆寫自父類別並重新定義的建構器
let secondArcher = Archer(name: "Joe")

// 類別本身自己定義的建構器
let anotherArcher = Archer(name: "Adam", attackRange: 2.4)
//最後定義一個繼承自Archer的類別Hunter，新增了兩個屬性hp跟description：
class Hunter: Archer {
    var hp = 100
    var description: String {
        return "\(name) ,基礎血量為 \(hp)"
    }
}
//上述程式可以看到，類別Hunter新增的兩個屬性都有預設值，且自己沒有定義任何建構器，所以它會自動繼承父類別的所有指定建構器跟便利建構器。可以使用所有繼承來的建構器來生成實體：
let oneHunter = Hunter()
let secondHunter = Hunter(name: "Black")
let anotherHunter = Hunter(name: "Dwight", attackRange: 3)


//可失敗的建構器
//
//類別、結構或是列舉在建構過程中可能失敗，這個失敗可能是傳入無效的參數、缺少某種外部需要的資源或是沒有滿足某種必要條件。
//為了處理這種可能失敗的情況，可以定義一個可失敗建構器(failable initializer)，使用方式為在init後面加上一個問號?：init?。
//Hint
//
//可失敗建構器的參數名稱及型別，不能與其他非可失敗建構器相同。
//嚴格來說，建構器都沒有返回值，但當必須表示一個建構器在建構過程中失敗時，會以return nil來表示。
//以下是一個例子：
// 定義一個結構 Animal 當傳入的參數為空字串時 建構過程會失敗
struct Animal {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

// 傳入 Lion 當參數
var oneAnimal = Animal(name: "Lion")
if let one = oneAnimal {
    print("動物的名字為 \(one.name)")
}

// 傳入一個空字串當參數 (請注意 空字串與 nil 完全不一樣)
var anotherAnimal = Animal(name: "")
if anotherAnimal == nil {
    print("沒有傳入名字 所以建構過程中失敗了")
}
//列舉型別的可失敗建構器
//
//可以定義一個帶一個或多個參數的可失敗建構器，來取得列舉型別中特定的成員，當參數無法匹配任何成員時，則為建構失敗。以下是個例子：
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
//上述程式是定義一個溫度單位的列舉，當失敗建構器的參數為K、C或F時，可以匹配到成員，則建構成功。相反地，輸入其他參數則不會匹配成功，則稱為建構失敗，則會返回nil，如下：
let oneUnit = TemperatureUnit(symbol: "F")
if oneUnit != nil {
    print("這是一個溫度單位")
}

let anotherUnit = TemperatureUnit(symbol: "X")
if anotherUnit == nil {
    print("這不是一個溫度單位")
}
//如果不為列舉定義一個可失敗建構器，其本身會自動建立一個帶有參數的可失敗建構器init?(rawValue:)，這個參數名稱rawValue是固定的，其型別與列舉成員原始值的型別相同。所以可以此來簡化上面定義的TemperatureUnit列舉，如下：
enum AnotherTemperatureUnit: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

// 可以匹配到成員的原始值 所以建構成功
let oneUnit2 = AnotherTemperatureUnit(rawValue: "F")

// 無法匹配到成員的原始值 所以建構失敗
let anotherUnit2 = AnotherTemperatureUnit(rawValue: "X")
//建構失敗的傳遞
//
//可失敗建構器的委任關係及規則如下：
//類別、結構或列舉的可失敗建構器可以橫向委任到同一個類別、結構或列舉裡的另一個可失敗建構器。
//類別的可失敗建構器可以向上委任到父類別的可失敗建構器。
//可失敗建構器可以委任到其他非可失敗建構器。可用來為已定義好的建構過程，增加可失敗的條件。
//只要委任傳遞過程中，遇到一個建構器失敗時，則整個建構過程會立即返回失敗，之後的程式碼都不會再執行。
//以下是一個例子：
// 定義一個類別 AnotherGameCharacter 有一個可失敗建構器
// 當名稱參數為空字串時會建構失敗
class AnotherGameCharacter {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

// 定義一個繼承自 AnotherGameCharacter 的類別 AnotherArcher
// 有一個可失敗建構器 當攻速參數小於 1 時會建構失敗
class AnotherArcher: AnotherGameCharacter {
    let attackSpeed: Int
    init?(name: String, attackSpeed: Int) {
        if attackSpeed < 1 { return nil }
        self.attackSpeed = attackSpeed
        super.init(name: name)
    }
}

// 作為參數的名稱跟攻速都符合規則 建構成功
// 會生成一個 AnotherArcher 的實體
let oneArcher2 = AnotherArcher(name: "Jim", attackSpeed: 2)

// 作為參數的攻速為 0 會建構失敗
// 在 AnotherArcher 中即返回 nil
// 不會再向上傳遞至父類別 AnotherGameCharacter
let anotherArcher2 = AnotherArcher(name: "Zack", attackSpeed: 0)

// 作為參數的名稱為空字串 會建構失敗
// 建構過程一直到父類別 AnotherGameCharacter 的建構器 才會失敗
let finalArcher = AnotherArcher(name: "", attackSpeed: 1)
//覆寫一個可失敗建構器
//
//你可以在類別中覆寫父類別的可失敗建構器，可覆寫成為可失敗建構器或非可失敗建構器。以下是個例子：
//Hint
//
//不能將一個父類別的非可失敗建構器，覆寫成為可失敗建構器。
//定義一個類別 Document
class Document {
    // 可選型別的屬性
    var name: String?
    // 使用這個建構器 會生成一個屬性 name 為 nil 的實體
    init() {}
    // 使用這個建構器 會生成一個屬性 name 不為空字串的實體
    // 或是建構失敗 返回 nil
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

// 定義一個繼承自 Document 的類別 AutomaticallyNamedDocument
class AutomaticallyNamedDocument: Document {
    // 覆寫父類別的建構器 會指派值給屬性
    override init() {
        super.init()
        self.name = "[未命名]"
    }
    // 覆寫父類別的可失敗建構器 成為 非可失敗建構器
    // 可以看到他將條件修改成為 不會有失敗的狀況發生
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[未命名]"
        } else {
            self.name = name
        }
    }
}
//當你用非可失敗建構器覆寫一個父類別的可失敗建構器，又需要向上委任到父類別的這個可失敗建構器時，必須強制解析這個父類別建構器，在super.init()後面加上一個驚嘆號!，表示這時建構過程一定會成功，不會返回nil，如下：
// 定義一個繼承自 Document 的類別 UntitledDocument
class UntitledDocument: Document {
    // 覆寫一個父類別的可失敗建構器 並向上委任到這個建構器
    override init() {
        // 這時必須強制解析這個父類別的建構器
        // 表示不會有失敗的狀況
        super.init(name: "[未命名]")!
    }
}
//就如同前面章節提過的，變數或常數的可選型別(optional type)及隱式解析可選型別(implicitly unwrapped optional)的關係，可失敗建構器也可以將問號?改為驚嘆號!，定義成init!，可以生成一個隱式解析可選型別的實體。
//
//必要建構器
//
//在類別的建構器前加上required，表示所有繼承這個類別的子類別，都必須實作這個建構器：
class SomeClass4 {
    required init() {
        // 建構器執行程式的實作
    }
}
//繼承這個類別的子類別，定義這個建構器時，前面同樣需要加上required(不需要override)：
class SomeSubclass: SomeClass4 {
    required init() {
        // 必要建構器執行程式的實作
    }
}


//解構器
//
//與建構過程相對的，在一個類別的實體不再被需要使用時，Swift 會自動將其釋放掉，在釋放前會先進行解構過程，使用解構器(deinitializer)來實作，也就是deinit方法。
//每個定義的類別中，只能有一個解構器，解構器沒有任何參數，也不需要寫小括號()，格式如下：
//deinit {
//    執行的解構過程
//}
//Swift 有一個自動參考計數(ARC)的機制，會處理實體的記憶體管理，所以大部分的情況下，不需要手動清除，交給 Swift 來自動處理就好。
//後面章節會正式介紹自動參考計數(ARC)
