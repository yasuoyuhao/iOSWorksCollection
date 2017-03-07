//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//函式定義
//
//函式(function)是一個獨立的程式碼區塊，用來完成特定任務。當你需要一個會多次使用到的功能時，將這個功能寫成一個函式可以簡化程式碼。
//函式命名的方式與常數變數一樣，但名稱後面需要加上小括號()(像是前面章節很常使用的print()，就是一個內建的函式)。建立一個函式要使用func關鍵字，函式格式如下：
//func 函式名稱(參數: 參數型別) -> 返回值型別 {
//    內部執行的程式
//    return 返回值
//}
//依據上述介紹，你可以為一個函式設置傳入的參數與返回值，但也可以依據需求都不設置，如下為一個最簡單的函式格式：
//func 函式名稱() {
//    內部執行的程式
//}

// 建立一個函式
func simpleOne() {
    print("It is a simple function .")
}

// 呼叫函式
simpleOne()
// 這樣就會執行函式內的程式 這邊是一個簡單的功能
// 印出：It is a simple function .


//函式參數
//
//函式可以傳入參數(parameter)，定義函式的參數時，必須明確標註型別，會將參數指派給一個常數，格式如下：
//func 函式名稱(參數指派給的常數: 型別標註) {
//    內部執行的程式
//}
//以下是一個例子：
// 建立函式 有一個型別為 Int 的參數
// 函式的功能是將帶入的參數加一 並印出來
func addOne(number: Int) {
    // number 即為被指派參數的常數 只能在函式內部範圍內使用
    print(number + 1)
}

// 呼叫函式 傳入整數 12
// 印出：13
addOne(number: 12)


//多重參數函式
//
//函式如果有超過一個參數時，要依序將參數填入，並以逗號,隔開，以下是一個例子：
// 建立一個有兩個參數的函式 參數的型別分別為 String 及 Int
func hello(name: String, age: Int) {
    print("\(name) is \(age) years old .")
}

// 呼叫函式
hello(name: "Jack", age: 25)


//函式參數名稱
//
//每個函式的參數的完整定義方式，都包含參數標籤(argument label)及參數名稱(parameter name)
//參數標籤用於呼叫函式時，標註給函式的參數。
//參數名稱用於函式內部操作。
//以下為一個有參數標籤及參數名稱的函式格式：
//func 函式名稱(參數標籤1 參數名稱1: 型別1,
//                  參數標籤2 參數名稱2: 型別2) {
//    // 內部執行的程式
//}
//以下為一個例子：
func hello2(name n: String, age a: Int) {
    // n 跟 a 為參數名稱 在函式內部使用
    print("\(n) is \(a) years old .")
}

// name 跟 age 為參數標籤 呼叫函式時要標註在參數之前
hello2(name: "Jack", age: 25)
//省略參數標籤
//
//如果呼叫函式時想要省略參數標籤(argument label)，定義函式時只要使用下底線_來替代參數標籤即可，以下為一個例子：
// 參數標籤使用下底線 _ 替換
func hello3(_ name: String, _ age: Int) {
    print("\(name) is \(age) years old .")
}

// 呼叫函式時 就可以不用寫參數標籤
hello3("Jack", 33)
//或是在定義函式時省略參數標籤，這樣就可以將參數名稱當作參數標籤使用，如下：
// 使用函式的參數名稱作為參數標籤 這邊就是 name 與 age
func hello4(name: String, age: Int) {
    print("\(name) is \(age) years old .")
}

// 呼叫函式時 使用的參數標籤即為參數名稱
hello4(name: "Jack", age: 25)
//Swift 會這樣稍微複雜的設計函式參數名稱，是為了讓呼叫函式時，語意可以更明顯，以下是一個例子：
func sayHello(to name: String, and name2: String) {
    print("Hello \(name) and \(name2) !")
}
// 參數標籤設為 to 跟 and
// 這行看起來就像個完整的英文句子 可以明顯的知道這個函式要幹嘛
sayHello(to: "Joe", and: "Amy")


//預設參數值
//
//可以對函式的參數設定一個預設值，如果未傳入值時，則內部就使用這個預設值。如下：
func someFunction(number: Int = 12) {
    print(number)
}

// 印出：6
someFunction(number: 6)

// 沒有傳入值 則會使用預設值 印出：12
//someFunction()
//Hint
//
//有多重參數時，最好將有預設值的參數放在參數列表的最後，這樣呼叫函式時，可以保證其他無預設值參數的順序是一致的。


//可變數量參數
//
//函式的可變數量參數(variadic parameter)可以接受零個或多個值，呼叫函式時，使用可變數量參數來傳入數量不確定的參數，使用方法是在參數的型別後面加上三個點(...)，以下是個例子：
//這個函式有一個型別為Double...的可變數量參數，在函數內會轉成一個型別為[Double]的陣列常數。1

func arithmeticMean(numbers: Double...) -> Double { //不確定有幾個的時候用"..."
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1, 2, 3, 4, 5) // 返回 3.0
arithmeticMean(numbers: 3, 8, 19) // 返回 10.0


//輸入輸出參數
//
//普通函式的參數使用範圍都只在函式程式體內，如果想要一個可以修改參數的函式，並在呼叫函式結束後，這個修改仍然存在，則必須將參數設定為輸入輸出參數( In-Out Parameters )。使用方式為：
//定義函式時，在參數型別前加上inout。此參數不能有預設值，也不能再設為可變數量參數。
//當呼叫函式，傳入的參數作為輸入輸出參數時，需要在參數前加上&。這個參數只能是一個變數，不能是常數、字面量(單純的數值或字串)。
//以下是個例子：
// 定義一個[有一個輸入輸出參數]的函式 參數型別前要加上 inout
func newNumber(number: inout Int) {
    number *= 2
}

var n = 10
print(n) // 這時 n 為 10

// 傳入的參數在函式結束後 改變仍然存在
newNumber(number: &n)

print(n) // 所以這時再印出 就會是 20


//函式返回值
//
//函式除了可以傳入參數，同時也可以返回值，使用方式是在函式()後面接著一個減號跟大於組成的箭頭->，然後再接著寫返回值的型別標註，函式內部要使用return語句後接著返回值來返回。使用return後會隨即終止函式的動作，函式內部其後的程式都不會繼續執行。以下是個例子：1

// 定義函式 有一個型別為 Int 的參數以及一個型別為 Int 的返回值
// 函式的功能是將帶入的參數加十 並返回
func addTen(number: Int) -> Int {
    let n = number + 10
    // 使用 return 來返回值 這個返回值的型別要與上面標註的相同
    return n
}

// 呼叫函式 傳入整數 12 會返回 22
let newNumber = addTen(number: 12)

// 印出：22
print(newNumber)
//多重返回值函式

//函式可以有不只一個的返回值，返回值超過一個時以一個元組(Tuple)返回，元組內包含著要回傳的每個值的型別標註。在建立函式時也可以給返回元組的每個值加上名稱。以下是一個例子：
// 定義函式 有一個型別為 Int 的參數, 返回兩個型別為 Int 的值


func findNumbers(number: Int) -> (Int, Int) {
    let n = number + 10
    // 返回一個元組
    return (number, n)
    
    // 合併成一行直接返回也是可以
    // return (number, number + 10)
}

// 呼叫函式 傳入整數 12 會返回 (12, 22)
let numbers = findNumbers(number: 12)
// numbers 為一個元組 可以自 0 開始算 依序取得其內的值
// 印出：12 and 22
print("\(numbers.0) and \(numbers.1)")


// 定義另一個函式 將上面函式中返回的元組內的值加上名稱
func findNumbers2(number: Int) -> (oldNumber: Int, newNumber: Int) {
    let n = number + 10
    return (number, n)
}

// 呼叫函式 傳入整數 24 會返回 (24, 34)
let numbers2 = findNumbers2(number: 24)
// 這邊即可使用定義函式時 返回元組內的值設定的名稱
// 印出：24 and 34
print("\(numbers2.oldNumber) and \(numbers2.newNumber)")


//可選元組返回型別
//
//如果整個返回的元組可能會沒有值(nil)，可以將此返回元組設為可選元組型別，使用方式為在括號()後面接著一個問號?，像是(Int, String)?或是(String, Int, Int)?。以下是個例子：2

// 定義函式 參數為一個型別為 [Int] 的陣列
// 返回值為 包含兩個型別為 Int 的元組 或是 nil
func findNumbers3(arr: [Int]) -> (Int, Int)? { //可能沒有值的時候使用
    // 檢查傳入的陣列 如果其內沒有值的話 就直接返回 nil
    if arr.isEmpty {
        return nil
    }
    let n = arr[0] + 10
    let n2 = arr[0] + 100
    return (n, n2)
}

// 呼叫函式
// 因為返回的是一個可選型別 這邊先做可選綁定的動作 確定有值後再印出來
if let numbers = findNumbers3(arr: [11,22,33]) {
    print("\(numbers.0) and \(numbers.1)")
}
// 如果傳入的陣列 內部沒有值
if let numbers = findNumbers3(arr: []) {
    print("這裡不會被印出來")
}


//函式型別
//
//函式也是一種型別，由函式的參數型別和返回值型別組成：
//func someFunction(a: String, b: Int) -> Int {
    // 函式內部程式
//}
//上述程式中的函式，這個函式型別就標註為(String, Int) -> Int，意思就是有兩個型別依序為String跟Int的參數，會返回一個型別為Int的值。
//以下是另一個例子，如果沒有參數也沒有返回值時，函式型別標註為() -> Void。

func hello5() {
    print("Hello !")
}
//這個函式型別也可以標註為() -> ()。實際上，沒有返回值的函式，會返回一個特殊的值，叫做Void，也就是一個空的元組(tuple)，沒有任何元素，可以寫成()。



//    使用函式型別
//    
//    前面剛提過函式是一種型別，所以也可以將變數或常數宣告為一個函式，然後可以指派一個適當的函式。
//    以下是一個例子，宣告一個變數mathFunction，是一個型別為(Int) -> Int的函式，最後指派一個已經存在且型別相同的函式：
//    var mathFunction: (Int) -> Int = addTen
//    函式型別作為參數型別
//    
//    函式可以作為另一個函式的參數，以下是個例子：4
    
    // 定義一個將兩個整數相加的函式
    func addTwoInts(number1: Int, number2: Int) -> Int {
        return number1 + number2
    }
    
    // 定義另一個函式，有三個參數依序為
    // 型別為 (Int, Int) -> Int 的函式, Int, Int
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
        print("Result: \(mathFunction(a, b))")
    }
    
    // 將一個函式 addTwoInts 傳入函式 printMathResult
    printMathResult(addTwoInts, 3, 5)
//    上述程式中，作為參數的函式只需要型別正確，不用了解其內的程式如何運作，這表示可以將printMathResult函式一部分的操作交給呼叫函式的人來實作，也是以一種型別安全(type-safe)的方式來保證傳入函式的呼叫是正確的。
//    函式型別作為返回型別
//    
//    函式可以作為另一個函式的返回值，使用方式為在返回箭頭(->)後寫一個完整的函式型別。以下是個例子：2
//    
    // 定義一個將傳入的參數加一的函式
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    // 定義一個將傳入的參數減一的函式
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    // 建立一個參數為布林值的函式 會返回一個函式
    // 根據布林值返回上述兩個函式的其中一個
    func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
        return backwards ? stepBackward : stepForward
    }
    
    // 宣告一個整數常數
    let number = 3
    // 宣告一個函式常數
    let someFunction2 = chooseStepFunction(backwards: number > 0)
    // 根據 chooseStepFunction 函式的內容
    // 傳入 true 時 會返回 stepBackward 函式
    // 所以 someFunction2 會被指派為 stepBackward
    
    someFunction2(10) // 返回 9



//巢狀函式
//
//到目前為止所使用的函式都叫全域函式(global functions)，定義在全區域中，每個地方都可以使用。
//如果將函式建立在另一個函式中，稱作巢狀函式(nested function)，被建立在其內的函式只能在裡面使用，也可以當做返回值返回以讓其他地方也可以使用，以下為一個例子：
// 改寫前面的內容 將兩個函式建立在這個函式內
// 同樣是依據傳入的布林值 返回不同的函式
func anotherChooseStepFunction(backwards: Bool)->(Int)->Int{
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    return backwards ? stepBackward : stepForward
}

let number2 = -35
let someFunction3 = anotherChooseStepFunction(backwards: number2 > 0)

someFunction3(10) // 返回 11

