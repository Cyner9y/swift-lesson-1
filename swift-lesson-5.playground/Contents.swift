import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

protocol Car: AnyObject {
    
    var brand: String { get set}
    var model: String { get set}
    var isEngineOn: Bool { get set }
    var isWindowsUp: Bool { get set }
    var isLightsOn: Bool {get set}
    
    func handleLights()
}

extension Car {
    
    func handleWindows() {
        isWindowsUp = (isWindowsUp ? false : true)
    }
    
    func handleEngine() {
        isEngineOn = (isEngineOn ? false : true)
    }
}

class TeslaСar: Car {
    
    var brand = "Tesla"
    var model = "Model3"
    var isEngineOn = false
    var isWindowsUp = true
    var isLightsOn = true
    
    let spoiler: Bool
    let n2O: Bool
    
    func handleLights() {
        isLightsOn = (isLightsOn ? false : true)
    }
    
    init(spoiler: Bool, n2O: Bool) {
        self.spoiler = spoiler
        self.n2O = n2O
    }
}

extension TeslaСar: CustomStringConvertible {
    
    var description: String {
        return "Этот класс описывает автомобиль \(brand) \(model) у которого спойлер: \(spoiler) и закись азота: \(n2O)"
    }
}

class TrunkCar: Car {
    
    var brand = "Dodge"
    var model = "RAM"
    var isEngineOn = true
    var isWindowsUp = false
    var isLightsOn = false
    let towHitch: Bool
    let winch: Bool
    
    func handleLights() {
        isLightsOn = (isLightsOn ? false : true)
    }
    
    init(towHitch: Bool, winch: Bool) {
        self.towHitch = towHitch
        self.winch = winch
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Этот класс описывает автомобиль \(brand) \(model) у которого фаркоп: \(towHitch) и лебедка: \(winch)"
    }
}

let car1 = TeslaСar(spoiler: true, n2O: false)
let car2 = TrunkCar(towHitch: true, winch: false)

print(car1.description)
print(car2.description)

car1.handleLights()
print(car1.isLightsOn)
car1.handleEngine()
print(car1.isEngineOn)
car1.handleWindows()
print(car1.isWindowsUp)

car2.handleLights()
print(car2.isLightsOn)
car2.handleEngine()
print(car2.isEngineOn)
car2.handleWindows()
print(car2.isWindowsUp)
