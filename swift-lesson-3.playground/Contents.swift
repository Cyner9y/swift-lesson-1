import UIKit

//Задание №1 - Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//Задание №2 - Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//Задание №3 - Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//Задание №4 - Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//Задание №5 - Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//Задание №6 - Вывести значения свойств экземпляров в консоль.


enum EngineState {
    case start, stop
}

enum WindowsState {
    case open, close
}

enum TrunkState{
    case empty, full
}


struct SportCar {
    
    let brand: String
    let model: String
    let color: UIColor
    let year: Int
    var engineState: EngineState {
        willSet {
            newValue == .start ? print("Двигатель у \(brand) \(model) работает") : print("Двигатель у \(brand) \(model) не работает")
        }
    }
    var windowsState: WindowsState {
        willSet {
            newValue == .open ? print("Окна у \(brand) \(model) опущены") : print("Окна у \(brand) \(model) подняты")
        }
    }
    var trunkVolume: Int {
        didSet {
            if (trunkState == .empty) && (oldValue != 0) && (trunkVolume <= oldValue) {
                let freeSpace = oldValue - trunkVolume
                print("В багажник \(brand) \(model) загружено \(trunkVolume). Осталось места \(freeSpace)")
            } else {
                print("Багажник у \(brand) \(model) полон")
                trunkVolume = oldValue
            }
        }
    }
    var trunkState: TrunkState
    
    mutating func emptyTrunk() {
        self.trunkState = .empty
        print("Багажник у \(brand) \(model) пуст")
    }
}

struct TrunkCar {
    
    let brand: String
    let model: String
    let color: UIColor
    let year: Int
    var engineState: EngineState {
        willSet {
            newValue == .start ? print("Двигатель у \(brand) \(model) работает") : print("Двигатель у \(brand) \(model) не работает")
        }
    }
    var windowsState: WindowsState {
        willSet {
            newValue == .open ? print("Окна у \(brand) \(model) опущены") : print("Окна у \(brand) \(model) подняты")
        }
    }
    var trunkVolume: Int {
        didSet {
            if (trunkState == .empty) && (oldValue != 0) && (trunkVolume <= oldValue) {
                let freeSpace = oldValue - trunkVolume
                print("В багажник у \(brand) \(model) загружено \(trunkVolume). Осталось места \(freeSpace)")
            } else {
                print("Багажник у \(brand) \(model) полон")
                trunkVolume = oldValue
            }
        }
    }
    var trunkState: TrunkState
    
    mutating func emptyTrunk() {
        self.trunkState = .empty
        print("Багажник \(brand) \(model) пуст")
    }
}



var car1 = SportCar(brand: "Toyota", model: "Supra", color: .red, year: 1993, engineState: .stop, windowsState: .open, trunkVolume: 150, trunkState: .empty)
var car2 = SportCar(brand: "Audi", model: "TT", color: .yellow, year: 2012, engineState: .start, windowsState: .close, trunkVolume: 300, trunkState: .full)
var truck1 = TrunkCar(brand: "Chevrolet", model: "Tahoe", color: .green, year: 2012, engineState: .stop, windowsState: .open, trunkVolume: 250, trunkState: .empty)
var truck2 = TrunkCar(brand: "Dodge", model: "RAM", color: .blue, year: 2012, engineState: .start, windowsState: .close, trunkVolume: 300, trunkState: .full)

car1.engineState = .start
car1.trunkVolume = 50
car1.emptyTrunk()

car2.trunkVolume = 40
car2.emptyTrunk()
car2.trunkVolume = 30
car2.windowsState = .open
car2.color.accessibilityName
car2.color.cgColor

truck1.engineState = .stop
truck2.engineState = .start
truck2.trunkVolume = 555

print("""
\nПодробная информация о автомобиле \(car1.brand) \(car1.model):
    Цвет: \(car2.color.accessibilityName)
    Год выпуска: \(car1.year)
    Статус двигателя: \(car1.engineState)
    Статус окон: \(car1.windowsState)
""")

print("""
\nПодробная информация о автомобиле \(truck1.brand) \(truck1.model):
    Цвет: \(truck1.color.accessibilityName)
    Год выпуска: \(truck1.year)
    Статус двигателя: \(truck1.engineState)
    Статус окон: \(truck1.windowsState)
""")
