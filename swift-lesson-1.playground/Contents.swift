import UIKit

//Задание №1 - Решить квадратное уравнение

var str = "Hello, playground"
let a = Double(1)
let b = Double(8.5)
let c = Double(16)

let discr = pow(b, 2) - (4 * a * c)

if discr > 0 {
    var x1 = (-b + sqrt(discr)) / (2*a)
    var x2 = (-b - sqrt(discr)) / (2*a)
} else if discr == 0 {
    var x = -b / (2 * a)
} else {
    print("Уравнение не имеет решений в действительных числах")
}




//Задание №2 - Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let catet1: Double = 5.5
let catet2: Double = 10

if catet1 < 0 || catet2 < 0 {
    print("Катеты должны быть положительными числами")
} else {
    var ploshad = (catet1 * catet2) / 2
    let gipotenuza = sqrt(pow(catet1, 2) + pow(catet2, 2))
    var perimetr = catet1 + catet2 + gipotenuza
}





//Задание №3 - Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

let depositSum: Double = 10000
let percent: Double = 15.1
let years = 5
var totalDepositSum = depositSum + depositSum * (percent/100)


if depositSum < 0 || depositSum < 0 {
    print("Сумма депозита и процент должны быть положительными числами")
} else {
    for _ in 1...years {
        totalDepositSum += totalDepositSum * (percent/100)
    }
    print("Сумма вклада через " + String(years) + " лет: " + String(round(totalDepositSum * 100) / 100))
}
