import UIKit

//Задание №1 - Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//Задание №2 - Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//Задание №3 - Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//Задание №4 - В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//Задание №5 - Создать несколько объектов каждого класса. Применить к ним различные действия.
//Задание №6 - Вывести значения свойств экземпляров в консоль.


enum TrunkStatus {
    case open, close
}

enum Transmission {
    case manual, auto
}

enum UseWinch {
    case push, pull
}

enum N2oStatus {
    case start, stop
}

class Car {
    
    let bodyType: String
    let doorsNum: Int
    let seatsNum: Int
    let transmission: Transmission
    let volume: Double
    var trunkStatus: TrunkStatus?
    
    init(bodyType: String, doorsNum: Int, seatsNum: Int, transmission: Transmission, volume: Double, trunkStatus: TrunkStatus?){
        self.bodyType = bodyType
        self.doorsNum = doorsNum
        self.seatsNum = seatsNum
        self.transmission = transmission
        self.volume = volume
        self.trunkStatus = trunkStatus
    }
    
    func openTrunk(){}
}

class SportСar: Car {
    
    let v8Twin: Bool
    let spoiler: Bool
    var n2oStatus: N2oStatus
    
    init(v8Twin: Bool, spoiler: Bool, transmission: Transmission, volume: Double, n2oStatus: N2oStatus) {
        self.v8Twin=v8Twin
        self.spoiler = spoiler
        self.n2oStatus = n2oStatus
        super.init(bodyType: "Купе", doorsNum: 2, seatsNum: 2, transmission: transmission, volume: volume, trunkStatus: nil)
    }
    
    override func openTrunk() {
        switch trunkStatus {
        case .open:
            print("Багажник уже открыт")
        case .close:
            trunkStatus = .open
            print("Багажник открыт")
        default:
            print("В автомобиле нет багажника")
        }
    }
    
    func useN2o(n2oStatus: N2oStatus){
        if n2oStatus == .start {
            print ("Закись азота активирована")
        } else {
            print("Подача азота прекращена")
        }
    }
    

}

class TrunkCar: Car {
    
    let towHitch: Bool
    let winch: Bool
    let roofLampCount: Int
    
    init(towHitch: Bool, winch: Bool, roofLampCount: Int, doorsNum: Int, seatsNum: Int, volume: Double, trunkStatus: TrunkStatus) {
        self.towHitch = towHitch
        self.winch = winch
        self.roofLampCount = roofLampCount
        super.init(bodyType: "Внедорожник", doorsNum: doorsNum, seatsNum: seatsNum, transmission: .manual, volume: volume, trunkStatus: trunkStatus)
    }
    
    override func openTrunk() {
        if trunkStatus == .close {
            trunkStatus = .open
            print("Багажник открыт")
        } else {
            print("Багажник уже открыт")
        }
    }
}

var car1 = Car(bodyType: "Седан", doorsNum: 4, seatsNum: 4, transmission: .auto, volume: 1.6, trunkStatus: .open)
var car2 = SportСar(v8Twin: true, spoiler: false, transmission: .auto, volume: 6.0, n2oStatus: .stop)
var car3 = TrunkCar(towHitch: true, winch: true, roofLampCount: 6, doorsNum: 2, seatsNum: 3, volume: 5.0, trunkStatus: .close)
car2.openTrunk()
car2.useN2o(n2oStatus: .start)
car2.useN2o(n2oStatus: .stop)
car3.openTrunk()
car3.trunkStatus

print("""
    \nСпорткар:
    кузов: \(car2.bodyType)
    число дверей: \(car2.doorsNum)
    число сидений: \(car2.seatsNum)
    коробка передач: \(car2.transmission)
    объем двигателя: \(car2.volume)
    багажник: \(String(describing: car2.trunkStatus))
    """)

print("""
    \nВнедорожник:
    кузов: \(car3.bodyType)
    число дверей: \(car3.doorsNum)
    число сидений: \(car3.seatsNum)
    коробка передач: \(car3.transmission)
    объем двигателя: \(car3.volume)
    багажник: \(car3.trunkStatus!)
    """)
